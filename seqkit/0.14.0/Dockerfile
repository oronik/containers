
FROM ubuntu:20.04

MAINTAINER Gerrit Botha "gerrit.botha@uct.ac.za"
MAINTAINER Yagoub Ali Ibrahim Adam <yagoub@alumni.usp.br>
MAINTAINER H3ABioNet "helpdesk.h3abionet.org"


# Package information (METADATA) 
LABEL package.name="SeqKit"
LABEL version="v0.14.0 as at 08 Dec 2020"
LABEL package.source="https://github.com/shenwei356/seqkit"
LABEL package.description="A cross-platform and ultrafast toolkit for FASTA/Q file manipulation"
LABEL website="http://www.bioinformatics.babraham.ac.uk/projects/fastqc"
LABEL license="Open source and free for unlimited use"
LABEL documentation="https://bioinf.shenwei.me/seqkit/usage/"
LABEL container.size="522MB"


# Followed instructions here: https://github.com/conda/conda-docker/tree/master/miniconda3/debian
RUN apt-get -qq update && apt-get -qq -y install curl bzip2 wget \
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

ENV PATH /opt/conda/bin:$PATH

COPY environment.yml /
RUN conda env create -f /environment.yml && conda clean -a

# Switch back to the ubuntu user so this tool (and the files written) are not owned by root
RUN groupadd -r -g 1000 h3abionet && useradd -r -g h3abionet -u 1000 -m h3abionet
USER h3abionet

ENV PATH /usr/local/envs/seqkit/bin/:$PATH

WORKDIR /data/


# Package testing (running)
SeqKit -- a cross-platform and ultrafast toolkit for FASTA/Q file manipulation

#Version: 0.14.0

#Author: Wei Shen <shenwei356@gmail.com>

#Documents  : http://bioinf.shenwei.me/seqkit
#Source code: https://github.com/shenwei356/seqkit
#Please cite: https://doi.org/10.1371/journal.pone.0163962

#Usage:
  #seqkit [command]

#Available Commands:
  #amplicon        retrieve amplicon (or specific region around it) via primer(s)
  #bam             monitoring and online histograms of BAM record features
  #common          find common sequences of multiple files by id/name/sequence
  #concat          concatenate sequences with same ID from multiple files
  #convert         convert FASTQ quality encoding between Sanger, Solexa and Illumina
  #duplicate       duplicate sequences N times
  #faidx           create FASTA index file and extract subsequence
  #fish            look for short sequences in larger sequences using local alignment
  #fq2fa           convert FASTQ to FASTA
  #fx2tab          convert FASTA/Q to tabular format (with length/GC content/GC skew)
  #genautocomplete generate shell autocompletion script
  #grep            search sequences by ID/name/sequence/sequence motifs, mismatch allowed
  #head            print first N FASTA/Q records
  #help            Help about any command
  #locate          locate subsequences/motifs, mismatch allowed
  #mutate          edit sequence (point mutation, insertion, deletion)
  #pair            match up paired-end reads from two fastq files
  #range           print FASTA/Q records in a range (start:end)
  #rename          rename duplicated IDs
  #replace         replace name/sequence by regular expression
  #restart         reset start position for circular genome
  #rmdup           remove duplicated sequences by id/name/sequence
  #sample          sample sequences by number or proportion
  #sana            sanitize broken single line fastq files
  #scat            real time recursive concatenation and streaming of fastx files
  #seq             transform sequences (revserse, complement, extract ID...)
  #shuffle         shuffle sequences
  #sliding         sliding sequences, circular genome supported
  #sort            sort sequences by id/name/sequence/length
  #split           split sequences into files by id/seq region/size/parts (mainly for FASTA)
  #split2          split sequences into files by size/parts (FASTA, PE/SE FASTQ)
  #stats           simple statistics of FASTA/Q files
  #subseq          get subsequences by region/gtf/bed, including flanking sequences
  #tab2fx          convert tabular format to FASTA/Q format
  #translate       translate DNA/RNA to protein sequence (supporting ambiguous bases)
  #version         print version information and check for update
  #watch           monitoring and online histograms of sequence features

#Flags:
      #--alphabet-guess-seq-length int   length of sequence prefix of the first FASTA record based on which seqkit guesses the sequence type (0 for whole seq) (default 10000)
  #-h, --help                            help for seqkit
      #--id-ncbi                         FASTA head is NCBI-style, e.g. >gi|110645304|ref|NC_002516.2| Pseud...
      #--id-regexp string                regular expression for parsing ID (default "^(\\S+)\\s?")
      #--infile-list string              file of input files list (one file per line), if given, they are appended to files from cli arguments
  #-w, --line-width int                  line width when outputing FASTA format (0 for no wrap) (default 60)
  #-o, --out-file string                 out file ("-" for stdout, suffix .gz for gzipped out) (default "-")
      #--quiet                           be quiet and do not show extra information
  #-t, --seq-type string                 sequence type (dna|rna|protein|unlimit|auto) (for auto, it automatically detect by the first sequence) (default "auto")
  #-j, --threads int                     number of CPUs. (default value: 1 for single-CPU PC, 2 for others. can also set with environment variable SEQKIT_THREADS) (default 2)

#Use "seqkit [command] --help" for more information about a command.

#
