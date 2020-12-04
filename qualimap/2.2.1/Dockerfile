FROM ubuntu:20.04

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


