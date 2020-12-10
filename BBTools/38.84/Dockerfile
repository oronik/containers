
# Docker container base image
FROM ubuntu:20.04

# Maintainer
MAINTAINER Suresh Maslamoney "suresh.maslamoney@uct.ac.za"
MAINTAINER H3ABioNet "helpdesk.h3abionet.org"

# Package information
LABEL package.name="BBTools"
LABEL version="v38.84 as at 08 Dec 2020"
LABEL installation.source="MiniConda3"
LABEL package.description="Suite of fast, multithreaded bioinformatics tools designed for analysis of DNA and RNA sequence data.  See website for detailed description"
LABEL website="https://jgi.doe.gov/data-and-tools/bbtools/"
LABEL license="Open source and free for unlimited use"
LABEL container.size="1.15GB"

# Installation instructions
# Where possible,  if the latest stable release of the tool is avaiable in MiniConda,  install via MiniConda.

# Followed instructions here: https://github.com/grbot/containers/blob/master/samtools/docker/Dockerfile
RUN apt -qq update && apt -qq -y install curl bzip2 wget openjdk-8-jre-headless \
    && curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -bfp /usr/local \
    && rm -rf /tmp/miniconda.sh \
    && conda install -y python=3 \
    && conda update conda \
    && apt-get -qq -y remove curl bzip2 \
    && apt-get -qq -y autoremove \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /var/log/dpkg.log \
    && conda clean --all --yes


# Set the environment
ENV PATH /opt/conda/bin:$PATH


# Copy environment.yml file from host OS.  File contains tool package and dependencies to be installed from conda.
COPY environment.yml /
RUN conda env create -f /environment.yml && conda clean -a

# Switch back to the ubuntu user so this tool (and the files written) are not owned by root
RUN groupadd -r -g 1000 ubuntu && useradd -r -g ubuntu -u 1000 -m ubuntu
USER ubuntu

# When reusing this script,  make sure to change the tool name in the PATH
ENV PATH /usr/local/envs/bbtools/bin/:$PATH

# Package testing:

# To test the installation, run stats.sh against the PhiX reference genome (included in the BBTools download):
#      /usr/local/envs/BBTOOLS/bin/stats.sh in=/usr/local/envs/BBTOOLS/opt/bbmap-38.84-0/resources/phix174_ill.ref.fa.gz

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

