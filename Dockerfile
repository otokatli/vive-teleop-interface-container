FROM ros:noetic-ros-base

LABEL maintainer="Ozan Tokatli"
LABEL email="ozan.tokatli@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive
ENV ROS_WS=/workspace

# Use bash
SHELL ["/bin/bash", "-c"]

RUN mkdir -p $ROS_WS/src
WORKDIR $ROS_WS

COPY ./vive-teleop src/vive_teleop

RUN apt-get update && apt-get install -y --no-install-recommends python3-tf2-geometry-msgs 

RUN source /opt/ros/$ROS_DISTRO/setup.bash && catkin_make

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["bash"]
