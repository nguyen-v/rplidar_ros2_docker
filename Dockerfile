# Use an ARM64 ROS2 base image (adjust distro as needed)
FROM arm64v8/ros:jazzy
ENV ROS_DISTRO=jazzy

# Install necessary tools
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    python3-colcon-common-extensions \
 && rm -rf /var/lib/apt/lists/*

# Set workspace directory
WORKDIR /app

# Clone the sllidar_ros2 repository
RUN mkdir -p src
WORKDIR /app/src
RUN git clone https://github.com/Slamtec/sllidar_ros2.git

# Build the workspace with colcon
WORKDIR /app
RUN /bin/bash -c "source /opt/ros/jazzy/setup.bash && colcon build --symlink-install"

# Copy the entrypoint script and ensure it’s executable
COPY docker_entrypoint.sh /app/
RUN chmod +x /app/docker_entrypoint.sh

# Set the entrypoint and default command
ENTRYPOINT ["/app/docker_entrypoint.sh"]
CMD ["bash"]
