FROM ubuntu:20.04

RUN apt-get -qq update && apt-get -qq -y install curl bzip2 wget \
    && curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -bfp /usr/local \
    && rm -rf /tmp/miniconda.sh \
    && conda install -y python=3 \
    && conda update conda \
    && apt-get -qq -y remove curl bzip2 \
    && apt-get -qq -y autoremove \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /var/log/dpkg.log \
    && conda clean --all --yes

ENV PATH /opt/conda/bin:$PATH

COPY environment.yml /
RUN conda env create -f /environment.yml && conda clean -a

# Switch to ubuntu user so this tool (and the files written) are not owned by root
RUN groupadd -r -g 1000 ubuntu && useradd -r -g ubuntu -u 1000 -m ubuntu
USER ubuntu

ENV PATH /usr/local/envs/kraken2/bin/:$PATH

################## NO DATABASE IS INCLUDED WITH THIS DOCKER IMAGE ######################

## You shall need to mount a directory from the host machine that contains kraken2 database files to a directory in the container

################## HOW TO DOWNLOAD DATABASE ######################

# How to Download, say, MiniKraken DB_8GB (5.5 GB): 
# 8 GB Kraken2 database built from the Refseq bacteria, archaea, and viral libraries and the GRCh38 human genome(as of April. 23, 2019) 
# Option '--strip-components=1' is used so that the *.k2d files end up inside /kraken2-db and not elsewhere
# RUN mkdir /kraken2-db && \
# cd /kraken2-db && \
# wget https://genome-idx.s3.amazonaws.com/kraken/minikraken2_v2_8GB_201904.tgz && \
# tar -zxf --strip-components=1 minikraken2_v2_8GB_201904.tgz && \
# rm -rf minikraken2_v2_8GB_201904.tgz
