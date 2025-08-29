git clone --depth 1 --filter=blob:none --sparse https://github.com/andrew153d/HomeLab.git
cd HomeLab
git sparse-checkout set dashboard

# Dashboard Kiosk Setup

This guide explains how to set up a Chromium browser in kiosk mode using the provided setup script.

---

## 1. Clone Only the `dashboard` Directory


```bash
cd ~
rm -rf ~/HomeLab  # Remove any existing HomeLab directory in your home folder first
git clone --depth 1 --filter=blob:none --sparse https://github.com/andrew153d/HomeLab.git ~/HomeLab
cd ~/HomeLab
git sparse-checkout set dashboard
cd dashboard
```

---

## 2. Prerequisites

- Linux system with systemd (e.g., Raspberry Pi OS, Ubuntu)
- Chromium browser installed (`chromium-browser`)
- User must **not** be root

Install Chromium if not already installed:

```bash
sudo apt update && sudo apt install chromium-browser
```

---

## 3. Configure and Run the Kiosk Setup Script

1. **Edit the URL**
	- Open `setup-kiosk.sh.sh` in a text editor.
	- Change the `URL` variable to your desired dashboard address.

2. **Run the Script as a Normal User**
	- Do **not** run as root. Use your regular user account (e.g., `pi`).

```bash
./setup-kiosk.sh.sh
```

3. **Reboot**
	- The script will enable the kiosk service and prompt for a reboot. Uncomment the reboot line in the script if you want it to reboot automatically.

---

## 4. What the Script Does

- Creates a startup script to launch Chromium in kiosk mode at login
- Sets up a systemd service to run the browser on boot
- Enables the service for the current user

---

## 5. Troubleshooting

- Make sure your user can start a graphical session (X server)
- If Chromium does not start, check the service status:

```bash
systemctl --user status kiosk.service
```

Or for system-wide service:

```bash
sudo systemctl status kiosk.service
```

---