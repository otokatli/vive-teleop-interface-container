FROM ros:noetic-ros-base

# Use bash
SHELL ["/bin/bash", "-c"]

ARG ROS_WS=/workspace
RUN mkdir -p $ROS_WS/src
WORKDIR $ROS_WS

COPY ./vive_teleop_interface src/vive-teleop_interface

RUN apt-get update && apt-get install -y --no-install-recommends python3-tf2-geometry-msgs 

RUN source /opt/ros/$ROS_DISTRO/setup.bash && catkin_make

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
