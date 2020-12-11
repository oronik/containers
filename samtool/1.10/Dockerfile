
FROM ubuntu:20.04
MAINTAINER Gerrit Botha "gerrit.botha@uct.ac.za"


RUN  apt-get update -y
RUN apt-get install samtools -y


RUN groupadd -r -g 1000 ubuntu && useradd -r -g ubuntu -u 1000 -m ubuntu
USER ubuntu

ENV PATH /usr/local/envs/samtools/bin/:$PATH
