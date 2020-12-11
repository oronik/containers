
# Docker container base image
FROM ubuntu:20.04

# Maintainer
MAINTAINER Suresh Maslamoney "suresh.maslamoney@uct.ac.za"
MAINTAINER H3ABioNet "helpdesk.h3abionet.org"

# Package information
LABEL package.name="BBTools"
LABEL version="v38.87 as at 08 Dec 2020"
LABEL package.source="https://sourceforge.net/projects/bbmap/files/BBMap_38.87.tar.gz/download"
LABEL package.description="Suite of fast, multithreaded bioinformatics tools designed for analysis of DNA and RNA sequence data.  See website for detailed description"
LABEL website="https://jgi.doe.gov/data-and-tools/bbtools/"
LABEL license="Open source and free for unlimited use"
LABEL container.size="1.15GB"

# Installation instructions
RUN apt -qq update && apt -qq -y install wget openjdk-8-jre-headless \
    && apt-get -qq -y autoremove \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /var/log/dpkg.log

RUN wget https://sourceforge.net/projects/bbmap/files/BBMap_38.87.tar.gz \
    && tar -xzf BBMap_38.87.tar.gz \
    && rm BBMap_38.87.tar.gz \ 
    && apt-get -qq -y remove wget \
    && apt-get -qq -y autoremove \
    && apt-get autoclean

# Switch back to the ubuntu user so this tool (and the files written) are not owned by root
RUN groupadd -r -g 1000 ubuntu && useradd -r -g ubuntu -u 1000 -m ubuntu
USER ubuntu

# Working directory
WORKDIR /bbmap

# Package testing:

# To test the installation, run stats.sh against the PhiX reference genome (included in the BBTools download):
#    /bbmap/stats.sh in=/bbmap/resources/phix174_ill.ref.fa.gz

# Expected outcome below.  See website for additional detail.

#A       C       G       T       N       IUPAC   Other   GC      GC_stdev
#0.2399  0.2144  0.2326  0.3130  0.0000  0.0000  0.0000  0.4471  0.0000

#Main genome scaffold total:             1
#Main genome contig total:               1
#Main genome scaffold sequence total:    0.005 MB
#Main genome contig sequence total:      0.005 MB        0.000% gap
#Main genome scaffold N/L50:             1/5.386 KB
#Main genome contig N/L50:               1/5.386 KB
#Max scaffold length:                    5.386 KB
#Max contig length:                      5.386 KB
#Number of scaffolds > 50 KB:            0
#% main genome in scaffolds > 50 KB:     0.00%
#
#
#Minimum         Number          Number          Total           Total           Scaffold
#Scaffold        of              of              Scaffold        Contig          Contig  
#Length          Scaffolds       Contigs         Length          Length          Coverage
#--------        --------------  --------------  --------------  --------------  --------
#    All                      1               1           5,386           5,386   100.00%
#   5 KB                      1               1           5,386           5,386   100.00%

# EOF

