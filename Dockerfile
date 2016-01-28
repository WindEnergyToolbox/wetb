# Docker file for gitlab CI test image

FROM buildpack-deps:jessie

MAINTAINER Mads M. Pedersen <mmpe@dtu.dk>

ENV SHELL /bin/bash

RUN apt-get update \
 && apt-get install --fix-missing -y -q \
    git-all \
    python3-pip \
    python3-dev \
    build-essential \
    python3-numpy \
    python3-matplotlib \
    python3-scipy \
 && apt-get autoremove -y \
 && apt-get clean -y
 RUN pip3 install -U setuptools
 RUN git clone https://gitlab.windenergy.dtu.dk/toolbox/WindEnergyToolbox.git

