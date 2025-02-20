#!/bin/bash
# Resolve the actual device that /dev/rplidar points to
DEVICE=$(readlink -f /dev/rplidar)

if [ -z "$DEVICE" ]; then
  echo "Error: /dev/rplidar not found. Please ensure your udev rule is working."
  exit 1
fi

echo "RPLIDAR C1 detected device: $DEVICE"

# Run the container, passing the actual device
docker run -it --rm --device="$DEVICE" sllidar_ros2:latest\
  ros2 launch sllidar_ros2 sllidar_c1_launch.py serial_port:=$DEVICE