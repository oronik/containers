FROM ubuntu:20.04

# Maintainer
MAINTAINER Houcemeddine Othman "houceme.othman@bioinfo-on-dunes.net"
MAINTAINER H3ABioNet "helpdesk.h3abionet.org"

# Package information
LABEL package.name="hifiasm"
LABEL version="0.13 as at 10 Dec 2020"
LABEL package.source="https://github.com/chhylp123/hifiasm"
LABEL package.dependencies="zlib (version not specified)"
LABEL package.description="Hifiasm is a fast haplotype-resolved de novo assembler for PacBio Hifi reads. It can assemble a human genome in several hours and works with the California redwood genome, one of the most complex genomes sequenced so far."
LABEL website="https://github.com/chhylp123/hifiasm"
LABEL license="MIT License"
LABEL container.size="134MB"

RUN apt-get update && apt-get install -y \ 
	git \ 
	automake \ 
	build-essential \ 
	zlib1g-dev && \ 
	git clone https://github.com/chhylp123/hifiasm.git && \  
	cd hifiasm && \ 
	make && \ 
	mv hifiasm /usr/local/bin && \ 
	apt-get -qq -y remove git build-essential automake && \ 
	apt-get -qq -y autoremove && \ 
	apt-get autoclean && \ 
	rm -rf /var/lib/apt/lists/* \
	cd / ; rm -rf /hifiasm/  

RUN groupadd -r -g 1000 h3abionet && useradd -r -g h3abionet -u 1000 -m h3abionet

USER h3abionet



