### Base ###

FROM ubuntu:20.04

### Maintainer ###
MAINTAINER Jorge da Rocha "jorge.darocha@students.wits.ac.za"
MAINTAINER H3ABioNet "helpdesk.h3abionet.org"

# Package information
LABEL package.name="MEGAHIT"
LABEL version="v1.2.9 as at 10 Dec 2020"
LABEL installation.source="MiniConda3"
LABEL package.dependencies="python > 3"
LABEL package.description="MEGAHIT is an ultra-fast and memory-efficient NGS assembler."
LABEL website="https://github.com/voutcn/megahit"
LABEL license="Open source and free for unlimited use"
LABEL container.size="534MB"

### Installation ###
# Followed instructions here: https://github.com/conda/conda-docker/tree/master/miniconda3/debian
RUN apt-get -qq update && apt-get -qq -y install curl bzip2 wget \
    && curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -bfp /usr/local \
    && rm -rf /tmp/miniconda.sh \
    && conda install -y python=3 \
    && conda update conda \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /var/log/dpkg.log \
    && conda clean --all --yes

ENV PATH /opt/conda/bin:$PATH

COPY environment.yml /
RUN conda env create -f /environment.yml && conda clean -a

# Switch back to the ubuntu user so this tool (and the files written) are not owned by root
RUN groupadd -r -g 1000 ubuntu && useradd -r -g ubuntu -u 1000 -m ubuntu
USER ubuntu

ENV PATH /usr/local/envs/MEGAHIT/bin/:$PATH

#package testing 
#run megahit --test
#expected result:

#2020-12-10 17:18:14 - MEGAHIT v1.2.9
#2020-12-10 17:18:14 - Using megahit_core with POPCNT and BMI2 support
#2020-12-10 17:18:14 - Convert reads to binary library
#2020-12-10 17:18:14 - b'INFO  sequence/io/sequence_lib.cpp  :   77 - Lib 0 (/usr/local/envs/MEGAHIT/share/megahit/test_data/r1.il.fa.gz): interleaved, 200 reads, 100 max length'
#2020-12-10 17:18:14 - b'INFO  sequence/io/sequence_lib.cpp  :   77 - Lib 1 (/usr/local/envs/MEGAHIT/share/megahit/test_data/r2.il.fa.bz2): interleaved, 200 reads, 100 max length'
#2020-12-10 17:18:14 - b'INFO  sequence/io/sequence_lib.cpp  :   77 - Lib 2 (/usr/local/envs/MEGAHIT/share/megahit/test_data/r3_1.fa,/usr/local/envs/MEGAHIT/share/megahit/test_data/r3_2.fa): pe, 200 reads, 100 max length'
#2020-12-10 17:18:14 - b'INFO  sequence/io/sequence_lib.cpp  :   77 - Lib 3 (/usr/local/envs/MEGAHIT/share/megahit/test_data/r4.fa): se, 2 reads, 100 max length'
#2020-12-10 17:18:14 - b'INFO  sequence/io/sequence_lib.cpp  :   77 - Lib 4 (/usr/local/envs/MEGAHIT/share/megahit/test_data/loop.fa): se, 2 reads, 547 max length'
#2020-12-10 17:18:14 - b'INFO  utils/utils.h                 :  152 - Real: 0.0066\tuser: 0.0000\tsys: 0.0000\tmaxrss: 7688'
#2020-12-10 17:18:14 - k-max reset to: 141 
#2020-12-10 17:18:14 - Start assembly. Number of CPU threads 4 
#2020-12-10 17:18:14 - k list: 21,29,39,59,79,99,119,141 
#2020-12-10 17:18:14 - Memory used: 3626971545
#2020-12-10 17:18:14 - Extract solid (k+1)-mers for k = 21 
#2020-12-10 17:18:14 - Build graph for k = 21 
#2020-12-10 17:18:15 - Assemble contigs from SdBG for k = 21
#2020-12-10 17:18:15 - Local assembly for k = 21
#2020-12-10 17:18:15 - Extract iterative edges from k = 21 to 29 
#2020-12-10 17:18:15 - Build graph for k = 29 
#2020-12-10 17:18:15 - Assemble contigs from SdBG for k = 29
#2020-12-10 17:18:15 - Local assembly for k = 29
#2020-12-10 17:18:16 - Extract iterative edges from k = 29 to 39 
#2020-12-10 17:18:16 - Build graph for k = 39 
#2020-12-10 17:18:16 - Assemble contigs from SdBG for k = 39
#2020-12-10 17:18:16 - Local assembly for k = 39
#2020-12-10 17:18:16 - Extract iterative edges from k = 39 to 59 
#2020-12-10 17:18:16 - Build graph for k = 59 
#2020-12-10 17:18:16 - Assemble contigs from SdBG for k = 59
#2020-12-10 17:18:16 - Local assembly for k = 59
#2020-12-10 17:18:16 - Extract iterative edges from k = 59 to 79 
#2020-12-10 17:18:16 - Merging to output final contigs 
#2020-12-10 17:18:16 - 2 contigs, total 1788 bp, min 559 bp, max 1229 bp, avg 894 bp, N50 1229 bp
#2020-12-10 17:18:16 - ALL DONE. Time elapsed: 2.075856 seconds 
