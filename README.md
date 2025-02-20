## Setting up dev rules
First you can hotplug your sensor and look at which device it corresponds (```ttyUSBx```)
```bash
sudo dmesg | grep tty
```
Then, you can get more information about the device with:
```bash
udevadm info -a -n /dev/ttyUSBx
```

You should modify the following fields in [rplidar.rules](scripts/rplidar.rules) to match the correct attributes for your USB to serial converter

```
ATTRS{idVendor} 
ATTRS{idProduct} 
ATTRS{serial}
```

```bash
./scripts/create_udev_rules.sh
```

To delete the rules, you can run:
```bash
./scripts/delete_udev_rules.sh
```

## Building the docker image
```bash
docker build -t sllidar_ros2:latest
```

## Running the node
```bash
./docker-run.sh
```