#!/bin/bash
docker run -it --rm \
  --device=/dev/sensors/rplidar \
  sllidar_ros2:latest \
  ros2 launch sllidar_ros2 sllidar_c1_launch.py serial_port:=/dev/sensors/rplidar