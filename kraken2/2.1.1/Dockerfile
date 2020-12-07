################# BASE IMAGE ######################
FROM ubuntu:20.04

# Specify build argument to ease upgrade.
ARG k2ver="2.1.1"

################## METADATA ######################
LABEL base.image="ubuntu:20.04"
LABEL dockerfile.version="1"
LABEL software="Kraken2"
LABEL software.version="2.1.1"
LABEL description="Taxonomic sequence classifier"
LABEL website="https://github.com/DerrickWood/kraken2"
LABEL license="https://github.com/DerrickWood/kraken2/blob/master/LICENSE"


################## MAINTAINER ######################
MAINTAINER Edward Lukyamuzi <elukyamuzi2010@gmail.com>

################## INSTALLATION ######################
# install dependencies and cleanup 
RUN apt-get update && apt-get install -y build-essential wget\
    perl libssl-dev libomp-dev \
    ncbi-blast+ rsync && \
    rm -rf /var/lib/apt/lists/* && apt-get autoclean

# install Kraken2
RUN wget https://github.com/DerrickWood/kraken2/archive/v${k2ver}.tar.gz && \
 tar -xzf v${k2ver}.tar.gz && \
 rm -rf v${k2ver}.tar.gz && \
 cd kraken2-${k2ver} && \
 ./install_kraken2.sh /usr/local/bin/kraken2-${k2ver} && \
 ln -s /usr/local/bin/kraken2-${k2ver}/kraken2* /usr/local/bin/ && \
 mkdir /data /kraken2-db

# Switch to the ubuntu user so this tool (and the files written) are not owned by root
RUN groupadd -r -g 1000 ubuntu && useradd -r -g ubuntu -u 1000 -m ubuntu
USER ubuntu


WORKDIR /data

################## NO DATABASE IS INCLUDED WITH THIS DOCKER IMAGE ######################

## You shall need to mount a directory from the host machine that contains kraken2 database files 
## to a directory in the container (/kraken2-db exists for this purpose)


################## HOW TO DOWNLOAD DATABASE ######################

# How to Download, say, MiniKraken DB_8GB (5.5 GB): 
# 8 GB Kraken2 database built from the Refseq bacteria, archaea, and viral libraries and the GRCh38 human genome(as of April. 23, 2019) 
# Option '--strip-components=1' is used so that the *.k2d files end up inside /kraken2-db and not elsewhere
# RUN mkdir /kraken2-db && \
# cd /kraken2-db && \
# wget https://genome-idx.s3.amazonaws.com/kraken/minikraken2_v2_8GB_201904.tgz && \
# tar -zxf --strip-components=1 minikraken2_v2_8GB_201904.tgz && \
# rm -rf minikraken2_v2_8GB_201904.tgz
