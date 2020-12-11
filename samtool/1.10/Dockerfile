### Base ###


FROM ubuntu:20.04

### Maintainer ###
MAINTAINER OLubukola Smile "bukolasmile@gmail.com"
MAINTAINER H3ABioNet "helpdesk.h3abionet.org"

# Package information
LABEL package.name="samtool"
LABEL version="v1.10 as at 10 Dec 2020"
LABEL installation.source="https://sourceforge.net/projects/samtools/files/samtools/1.10/"
LABEL package.dependencies="python > 3"
LABEL package.description="Samtools is a suite of programs for interacting with high-throughput sequencing data"
LABEL website="https://github.com/samtools/samtools"
LABEL license="Open source and free for unlimited use"
LABEL container.size="279MB"

RUN  apt-get update -y
RUN apt-get install samtools -y


RUN groupadd -r -g 1000 ubuntu && useradd -r -g ubuntu -u 1000 -m ubuntu
USER ubuntu

ENV PATH /usr/local/envs/samtools/bin/:$PATH

