#!/usr/bin/env bash
set -e

source devel/setup.bash

rosrun vive_teleop_interface teleop.py

exec "$@"
