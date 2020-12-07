FROM ubuntu:20.04
MAINTAINER Gerrit Botha "gerrit.botha@uct.ac.za"

COPY environment.yml /
RUN  apt-get update -y
RUN apt-get install samtools -y






# Switch back to the ubuntu user so this tool (and the files written) are not owned by root
RUN groupadd -r -g 1000 ubuntu && useradd -r -g ubuntu -u 1000 -m ubuntu
USER ubuntu

ENV PATH /usr/local/envs/samtools/bin/:$PATH
