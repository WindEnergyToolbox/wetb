# Docker file for gitlab CI test image

FROM buildpack-deps:jessie

MAINTAINER Mads M. Pedersen <mmpe@dtu.dk>

ENV SHELL /bin/bash

RUN apt-get update \
 && apt-get install --fix-missing -y -q \
    git-all \
    python-pip \
    python-dev \
    build-essential \
    python-numpy \
    python-scipy \
    python-matplotlib \
 && apt-get autoremove -y \
 && apt-get clean -y

