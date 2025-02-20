#!/bin/bash
set -e

source /opt/ros/${ROS_DISTRO}/setup.bash
source /app/install/setup.bash

exec "$@"
