FROM ubuntu:20.04

RUN apt update && apt upgrade
RUN apt install -y wget

#install deps for prusa slicer
RUN apt install -yqq libglu1 libgtk-3-0

WORKDIR /opt/
#Get prusa slicer version 2.4.1 from github
RUN wget -O prusa-slicer.AppImage https://github.com/prusa3d/PrusaSlicer/releases/download/version_2.4.1/PrusaSlicer-2.4.1+linux-x64-GTK3-202203101056.AppImage

RUN	chmod a+x prusa-slicer.AppImage
RUN /opt/prusa-slicer.AppImage --appimage-extract
RUN rm prusa-slicer.AppImage
RUN mv squashfs-root prusa-slicer
RUN cp -s /opt/prusa-slicer/AppRun /usr/bin/prusa-slicer
