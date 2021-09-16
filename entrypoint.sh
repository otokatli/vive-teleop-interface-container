#!/usr/bin/env bash
set -e

source "/opt/ros/$ROS_DISTRO/setup.bash"
source "/$ROS_WS/devel/setup.bash"

rosrun vive_teleop_interface teleop.py

exec "$@"
