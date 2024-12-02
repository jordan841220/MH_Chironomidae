#!/bin/bash

#############
### OTU
#############
source activate /mnt/space4/jordan-env/bin

usearch -unoise3 "fastq_merged/merged_filtered_uni_sort.fastq" -zotus "zotus.fa" -tabbedout "unoise3_result.txt"

# 97%
usearch -otutab "fastq_merged/merged_filtered_uni_sort.fastq" -zotus "zotus.fa" -otutabout "zotutab97.txt" -mapout "zmap97.txt" -threads 30


### tidy
sed -r 's/sample=([A-Z][0-9]+)..*/\1/' zmap97.txt > zmap97_tidy.txt