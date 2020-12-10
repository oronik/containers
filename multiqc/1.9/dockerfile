#Download base image ubuntu 20.04
FROM ubuntu:20.04

# LABEL about the custom image
LABEL maintainer="ghedirakais@gmail.com"
LABEL version="0.1"
LABEL description="This is custom Docker Image for \ the MultiQC Services."

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive
# Update Ubuntu Software repository and install wget
SHELL ["/bin/bash", "-c"]
RUN echo $SHELL

RUN apt-get -qq update && apt-get -qq -y install curl bzip2 wget \
    && curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -bfp /usr/local \
    && rm -rf /tmp/miniconda.sh \
    && conda install -y python=3 \
    && conda update conda \
    && apt-get -qq -y remove curl bzip2 \
    && apt-get -qq -y autoremove \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /var/log/dpkg.log
RUN conda create --name py3.7 python=3.7 -q -y \
    && conda install -c bioconda -c conda-forge multiqc -y -q
RUN multiqc --version
RUN multiqc --help

