# Docker file for gitlab CI test image

FROM buildpack-deps:jessie

MAINTAINER Mads M. Pedersen <mmpe@dtu.dk>

ENV SHELL /bin/bash

RUN apt-get install -y 



RUN apt-get update \
 && apt-get install --fix-missing -y -q \
    language-pack-en \
    git-all \
    python3-pip \
    python3-dev \
    build-essential \
    python3-numpy \
    python3-matplotlib \
    python3-scipy \
    locales \
 && apt-get autoremove -y \
 && apt-get clean -y
 
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales
 
RUN pip3 install -U setuptools
RUN git clone https://gitlab.windenergy.dtu.dk/toolbox/WindEnergyToolbox.git
RUN pip3 install -e ./WindEnergyToolbox

