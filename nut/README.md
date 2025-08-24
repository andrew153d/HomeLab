## Cloning only the nut directory

To clone only the `nut` folder from this repository:

```sh
    git clone --depth 1 --filter=blob:none --sparse https://github.com/andrew153d/HomeLab.git && cd HomeLab && git sparse-checkout set nut
```

## Setup

1. Edit the configuration files in `nut/config` as needed for your UPS hardware and environment.
2. Start the NUT service with Docker Compose:

```sh
cd nut
sudo docker compose up -d
```

## Resources
- [Network UPS Tools Documentation](https://networkupstools.org/docs/user-manual.chunked/)
- [instantlinux/nut-upsd Docker Hub](https://hub.docker.com/r/instantlinux/nut-upsd)
