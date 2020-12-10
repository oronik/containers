FROM ubuntu:20.04

# Maintainer
MAINTAINER Houcemeddine Othman "houcemeddine.othman@wits.ac.za"
MAINTAINER H3ABioNet "helpdesk.h3abionet.org"

# Package information
LABEL package.name="Fastp"
LABEL version="0.20.1 as at 10 Dec 2020"
LABEL package.source="https://github.com/OpenGene/fastp"
LABEL package.dependencies="zlib version not specified by the documentation"
LABEL package.description="A tool designed to provide fast all-in-one preprocessing for FastQ files. This tool is developed in C++ with multithreading supported to afford high performance."
LABEL website="https://github.com/OpenGene/fastp"
LABEL license="MIT License"
LABEL container.size="246MB"

 
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

RUN groupadd -r -g 1000 h3abionet && useradd -r -g h3abionet -u 1000 -m h3abionet

USER h3abionet




