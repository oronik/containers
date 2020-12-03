FROM ubuntu:20.04
LABEL maintainer="houcem.othman@bioinfo-on-dunes.net, h3abionet"
# version 0.20.1 is available on Dec 03 2020
LABEL fastp.h3abionet="recent version cloned from th gitHub repo"       
 
RUN apt-get update && apt-get install -y \ 
	git \ 
	automake \ 
	build-essential \ 
	zlib1g-dev  && \
	git clone https://github.com/OpenGene/fastp.git && \
	cd fastp && make && make install && \ 
	apt-get -qq -y remove git build-essential automake && \ 
	apt-get -qq -y autoremove && \ 
	apt-get autoclean && \ 
	rm -rf /var/lib/apt/lists/* 

RUN groupadd -r -g 1000 ubuntu && useradd -r -g ubuntu -u 1000 -m ubuntu

USER ubuntu 




