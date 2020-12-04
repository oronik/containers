#installing deps
#Updated from using bioclite to biocmanager
#Supports R3.6 now

# CountsQC

if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install(version = "3.12")


if(!require("optparse")) { 
    install.packages("optparse", repos = "http://cran.r-project.org") 
}

if(!require("NOISeq")) {
    BiocManager::install("NOISeq")
    
}

# Epigenetics

if(!require("XML")) { 
    install.packages("XML", repos = "http://cran.r-project.org")
}
   
if(!require("Repitools")) {
    BiocManager::install("Repitools")
}

if(!require("Rsamtools")) {
    BiocManager::install("Rsamtools")
}

if(!require("rtracklayer")) {
    BiocManager::install("rtracklayer")
}


