FROM ubuntu:18.04
LABEL maintainer="github.com/lbrame"
RUN apt -y update && apt -y upgrade
RUN dpkg --add-architecture i386
RUN apt -y update
RUN apt -y install build-essential gcc-multilib git nano vim neofetch htop wget
RUN wget https://github.com/JackHack96/logic-synthesis/releases/download/1.3.6/sis_1.3.6-1_amd64.deb
RUN dpkg -i sis_1.3.6-1_amd64.deb