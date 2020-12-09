################# BASE IMAGE ######################
FROM ubuntu:20.04

# Specify build argument to ease upgrade.
ARG ver="2.1.1"

################## METADATA ######################
LABEL base.image="ubuntu:20.04"
LABEL dockerfile.version="1"
LABEL software="canu"
LABEL software.version="2.1.1"
LABEL description="A single molecule sequence assembler for genomes large and small"
LABEL website="https://github.com/marbl/canu"
LABEL license="https://github.com/marbl/canu/blob/master/README.license.GPL"


################## MAINTAINER ######################
MAINTAINER Edward Lukyamuzi <elukyamuzi2010@gmail.com>

################## INSTALLATION ######################

ENV TZ=Africa/Kampala
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# install dependencies and cleanup 
RUN apt-get update && apt-get install -y build-essential \
 default-jre perl \
 wget gnuplot && \
 rm -rf /var/lib/apt/lists/* && apt-get autoclean

# install canu
RUN wget https://github.com/marbl/canu/releases/download/v${ver}/canu-${ver}.Linux-amd64.tar.xz && \
 tar -xJf canu-${ver}.Linux-amd64.tar.xz && \
 rm -rf canu-${ver}.Linux-amd64.tar.xz && \ 
 mkdir /data
 
ENV PATH="$PATH:/canu-${ver}/bin" \
    LC_ALL=C

# Switch to ubuntu user so this tool (and the files written) are not owned by root
RUN groupadd -r -g 1000 ubuntu && useradd -r -g ubuntu -u 1000 -m ubuntu
USER ubuntu

WORKDIR /data

