################# BASE IMAGE ######################
FROM ubuntu:20.04
RUN useradd -m ubuntu

################## METADATA ######################
LABEL version="1"
LABEL software="FASTQC"
LABEL software.version="0.11.9"
LABEL about.summary="A quality control tool for high throughput sequence data."
LABEL about.home="http://www.bioinformatics.babraham.ac.uk/projects/fastqc/"
LABEL about.documentation="http://www.bioinformatics.babraham.ac.uk/projects/fastqc/Help/"


################## MAINTAINER ######################
MAINTAINER Yagoub Ali Ibrahim Adam <yagoub@alumni.usp.br>

################## INSTALLATION ######################
USER root

ENV Temp=/tmp

RUN apt-get update -yqq && \
	apt-get  install -y wget && \
	apt-get install -y build-essential && \
	apt-get install  -y zip && \
	apt-get install  -y unzip &&\
	apt-get -qq -y autoremove &&\
	apt-get autoclean &&\
	rm -rf /var/lib/apt/lists/* /var/log/dpkg.log \


USER ubuntu
# FASTQC URL
     
ENV URL=http://www.bioinformatics.babraham.ac.uk/projects/fastqc/
ENV ZIP=fastqc_v0.11.9.zip

RUN wget $URL/$ZIP -O $Temp/$ZIP && \
unzip - $Temp/$ZIP -d $Temp && \
rm $Temp/$ZIP && \
cd $Temp/FastQC && \
chmod 755 fastqc && \
ln $Temp/FastQC/fastqc /usr/bin/fastqc
  


CMD fastqc


