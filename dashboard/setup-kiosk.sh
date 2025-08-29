#!/bin/bash
# setup-kiosk.sh
# This script sets up Chromium to run in kiosk mode on startup for the current user

# Prevent running as root
if [ "$(id -u)" -eq 0 ]; then
  echo "❌ Do not run this script as root. Run it as a normal user (e.g., 'pi')."
  exit 1
fi

SERVICE_NAME=kiosk.service
START_SCRIPT="$HOME/start-chromium.sh"
URL="http://example.com"   # <- change this to your desired URL

echo "Creating Chromium startup script in $START_SCRIPT..."
cat <<EOF > "$START_SCRIPT"
#!/bin/bash
# Wait for X server
sleep 5
# Run Chromium in kiosk mode
chromium-browser --noerrdialogs --disable-infobars --kiosk $URL
EOF

chmod +x "$START_SCRIPT"

echo "Creating systemd service..."
sudo tee /etc/systemd/system/$SERVICE_NAME > /dev/null <<EOF
[Unit]
Description=Chromium Kiosk
After=graphical.target

[Service]
User=$USER
Environment=XAUTHORITY=$HOME/.Xauthority
Environment=DISPLAY=:0
ExecStart=$START_SCRIPT
Restart=always
RestartSec=10

[Install]
WantedBy=graphical.target
EOF

echo "Reloading systemd..."
sudo systemctl daemon-reexec
sudo systemctl enable $SERVICE_NAME

echo "Setup complete. Rebooting now..."
sudo reboot
