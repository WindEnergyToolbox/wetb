# Docker file for gitlab CI test image

FROM buildpack-deps:jessie

MAINTAINER Frederik Zahle <frza@dtu.dk>

ENV SHELL /bin/bash

RUN apt-get update \
 && apt-get install --fix-missing -y -q \
    gfortran \
    git-all \
    python-pip \
    python-dev \
    build-essential \
    python-numpy \
    python-scipy \
 && apt-get autoremove -y \
 && apt-get clean -y
RUN wget https://www.open-mpi.org/software/ompi/v1.6/downloads/openmpi-1.6.5.tar.gz \
  && tar -xzf openmpi-1.6.5.tar.gz \
  && cd openmpi-1.6.5 \
  && ./configure --prefix=/usr/local --disable-dlopen \
  && make all install

ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/lib
