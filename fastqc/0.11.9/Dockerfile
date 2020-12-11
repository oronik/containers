
# BASE IMAGE (Docker container base image)
FROM ubuntu:20.04

# MAINTAINER 
MAINTAINER Yagoub Ali Ibrahim Adam <yagoub@alumni.usp.br>
MAINTAINER H3ABioNet "helpdesk.h3abionet.org"

# Package information (METADATA) 
LABEL package.name="FASTQC"
LABEL version="v0.11.9 as at 08 Dec 2020"
LABEL package.source="http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.9.zip"
LABEL package.description="A quality control tool for high throughput sequence data."
LABEL website="http://www.bioinformatics.babraham.ac.uk/projects/fastqc"
LABEL license="Open source and free for unlimited use"
LABEL documentation="http://www.bioinformatics.babraham.ac.uk/projects/fastqc/Help/"
LABEL container.size="522MB"


################## INSTALLATION ######################
USER root

ENV Temp=/tmp

RUN apt-get update -yqq \
     && apt-get -qq -y install  openjdk-11-jre-headless \
     && apt-get  install -y wget \
     && apt-get install -y build-essential \
     && apt-get install  -y zip \
     && apt-get install  -y unzip \
     && apt-get -qq -y autoremove \
     && apt-get autoclean \
     && rm -rf /var/lib/apt/lists/* /var/log/dpkg.log 

# FASTQC URL
ENV URL=http://www.bioinformatics.babraham.ac.uk/projects/fastqc/
ENV ZIP=fastqc_v0.11.9.zip

RUN wget $URL/$ZIP -O $Temp/$ZIP \
   && unzip - $Temp/$ZIP -d $Temp \
   && rm $Temp/$ZIP \
   && cd $Temp/FastQC \
   && chmod 755 fastqc 
RUN  ln  -s $Temp/FastQC/fastqc /usr/bin/fastqc 

ENV PATH /usr/local/bin:$PATH 
  
  
# Switch back to the ubuntu user so this tool (and the files written) are not owned by root
#RUN useradd -m h3abionet
RUN groupadd -r -g 1000 h3abionet && useradd -r -g h3abionet -u 1000 -m h3abionet
USER h3abionet

CMD fastqc

# Working directory
WORKDIR /fastqc

# Package testing (running)
#
#Running FastQC as part of a pipeline
#------------------------------------
#To run FastQC non-interactively you should use the fastqc wrapper script to launch the program.  You will probably want to use the zipped install file on every platform (even OSX).
#To run non-interactively you simply have to specify a list of files to process on the commandline
#
#
#fastqc somefile.txt someotherfile.txt
#
#
#You can specify as many files to process in a single run as you like.  If you don't specify any files to process the program will try to open the interactive application which may result in an error if you're running in a non-graphical environment.
#There are a few extra options you can specify when running non-interactively.  Full details of these can be found by running 
#
#
#fastqc --help
#
#
#By default, in non-interactive mode FastQC will create an HTML report with embedded graphs, but also a zip file containing individual graph files and additional data files containing the raw data from which plots were drawn.  The zip file will not be extracted by default but you can enable this by adding:
#
#
#--extract
#
#
#To the launch command.
#
#If you want to save your reports in a folder other than the folder which contained your original FastQ files then you can specify an alternative location by setting a
#
#
#--outdir value:
#
#--outdir=/some/other/dir/
#
#
#If you want to run fastqc on a stream of data to be read from standard input then you can do this by specifing 'stdin' as the name of the file to be processed and then  streaming uncompressed fastq format data to the program.  For example:
#
#
#zcat *fastq.gz | fastqc stdin

