FROM ubuntu:20.04

RUN apt update && apt upgrade -yqq
RUN apt install -y wget

#install deps for prusa slicer
RUN apt install -yqq libglu1 libgtk-3-0

WORKDIR /opt/
#Get prusa slicer version 2.4.1 from github
RUN wget -O prusa-slicer.tar.bz2 https://github.com/prusa3d/PrusaSlicer/releases/download/version_2.4.1/PrusaSlicer-2.4.1+linux-x64-GTK3-202203101056.tar.bz2

RUN mkdir prusa-slicer
RUN tar -xf prusa-slicer.tar.bz2 -C prusa-slicer --strip-components=1
RUN rm prusa-slicer.tar.bz2
RUN cp -s /opt/prusa-slicer/prusa-slicer /usr/bin/prusa-slicer
