FROM ubuntu:20.04
# version 0.13 is available on Dec 07 2020
LABEL hifiasm.h3abionet="recent version cloned from th gitHub repo" 


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

RUN groupadd -r -g 1000 ubuntu && useradd -r -g ubuntu -u 1000 -m ubuntu

USER ubuntu 



