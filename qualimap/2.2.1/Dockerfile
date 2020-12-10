# Docker Container Base Image
FROM ubuntu:20.04

# Maintainer
MAINTAINER Houcemeddine Othman "houcemeddine.othman@wits.ac.za"
MAINTAINER Jorge da Rocha "jorge.darocha@students.wits.ac.za"
MAINTAINER H3ABioNet "helpdesk.h3abionet.org"

# Package information
LABEL package.name="Qualimap"
LABEL version="v2.2.1 as at 10 Dec 2020"
LABEL package.source="https://bitbucket.org/kokonech/qualimap/downloads/qualimap_v2.2.1.zip"
LABEL package.dependencies="Java > 6, R > 3.1"
LABEL package.description="Qualimap 2 is a platform-independent application written in Java and R that provides both a Graphical User Inteface (GUI) and a command-line interface to facilitate the quality control of alignment sequencing data and its derivatives like feature counts."
LABEL website="http://qualimap.conesalab.org/"
LABEL license="Open source and free for unlimited use"
LABEL container.size="1.43GB"


ENV TZ=Africa/Johannesburg
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \ 
	wget \
	unzip \ 
	openjdk-14-jre \ 
	r-base-core \
	libcurl4-openssl-dev \ 
	libxml2-dev && \ 
	wget https://bitbucket.org/kokonech/qualimap/downloads/qualimap_v2.2.1.zip && \
	unzip qualimap_v2.2.1.zip  

COPY install_dep.R /

#Installs other dependencies with biocmanager - this requires R >= 3.6  
RUN Rscript install_dep.R && \ 
	cd qualimap_v2.2.1 && \
	Rscript scripts/installDependencies.r 
	

# make sure qualimap is executable

RUN chmod +x /qualimap_v2.2.1/qualimap

# Switch back to the ubuntu user so this tool (and the files written) are not owned by root

RUN groupadd -r -g 1000 ubuntu && useradd -r -g ubuntu -u 1000 -m ubuntu
USER ubuntu
WORKDIR /
ENV PATH /qualimap_v2.2.1:$PATH

#package testing:
#To test, run: qualimap --help
#Expected outcome below:

#############
#Java memory size is set to 1200M
#Launching application...

#OpenJDK 64-Bit Server VM warning: Ignoring option MaxPermSize; support was removed in 8.0
#QualiMap v.2.2.1
#Built on 2016-10-03 18:14
#
#usage: qualimap <tool> [options]
#
#To launch GUI leave <tool> empty.
#
#Available tools:
#
#    bamqc            Evaluate NGS mapping to a reference genome
#    rnaseq           Evaluate RNA-seq alignment data
#    counts           Counts data analysis (further RNA-seq data evaluation)
#    multi-bamqc      Compare QC reports from multiple NGS mappings
#    clustering       Cluster epigenomic signals
#    comp-counts      Compute feature counts
#
#Special arguments: 
#
#    --java-mem-size  Use this argument to set Java memory heap size. Example:
#                     qualimap bamqc -bam very_large_alignment.bam --java-mem-size=4G

