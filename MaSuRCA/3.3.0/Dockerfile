
# Docker container base image
FROM ubuntu:20.04

# Maintainer
MAINTAINER Suresh Maslamoney "suresh.maslamoney@uct.ac.za"
MAINTAINER H3ABioNet "helpdesk.h3abionet.org"

# Package information
LABEL package.name="MaSuRCA"
LABEL version="v3.3.0 as at 09 Dec 2020"
LABEL installation.source="conda"
LABEL package.description="MaSuRCA is whole genome assembly software"
LABEL website="http://www.genome.umd.edu/masurca.html"
LABEL license="Open source"
LABEL citation="if used, please cite >> https://academic.oup.com/bioinformatics/article/29/21/2669/195975"
LABEL container.size="1.88GB"


# Installation instructions
# Followed instructions here: https://github.com/grbot/containers/blob/master/samtools/docker/Dockerfile
RUN apt -qq update && apt -qq -y install curl bzip2 wget \
    && curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -bfp /usr/local \
    && rm -rf /tmp/miniconda.sh \
    && conda install -y python=3 \
    && conda update conda \
    && apt-get -qq -y remove curl bzip2 wget \
    && apt-get -qq -y autoremove \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /var/log/dpkg.log \ 
    && conda clean --all --yes

# Set the environment
ENV PATH /opt/conda/bin:$PATH

# Copy environment.yml file from host OS.  File contains tool package and dependencies to be installed from conda.
COPY environment.yml /
RUN conda env create -f /environment.yml && conda clean -a

# Switch back to the ubuntu user so this tool (and the files written) are not owned by root
RUN groupadd -r -g 1000 ubuntu && useradd -r -g ubuntu -u 1000 -m ubuntu
USER ubuntu

# When reusing this script,  make sure to change the tool name in the PATH
ENV PATH /usr/local/envs/MaSuRCA/bin/:$PATH


# EOF

