#!/bin/bash

source activate /mnt/space4/jordan-env/bin

### download ref fasta

cat ref/ref_Chiro_COI_5P_20241129.fasta | seqkit grep -n -r -p sp\\. -v > ref/ref_ChiroWithSpeciesName_COI_5P_20241129.fasta
usearch -fastx_uniques ref/ref_ChiroWithSpeciesName_COI_5P_20241129.fasta -fastaout ref/ref_ChiroWithSpeciesName_uniq_COI_5P_20241129.fasta -sizeout

# 00:00 48Mb    100.0% Reading ref/ref_ChiroWithSpeciesName_COI_5P_20241129.fasta
# 00:00 14Mb   CPU has 48 cores, defaulting to 10 threads                        
# 00:00 100Mb   100.0% DF
# 00:00 100Mb  9015 seqs, 5308 uniques, 4203 singletons (79.2%)
# 00:00 100Mb  Min size 1, median 1, max 180, avg 1.70
# 00:00 100Mb   100.0% Writing ref/ref_ChiroWithSpeciesName_no_COI_5P_20241129.fasta


seqkit subseq -r 231:-1 ref/ref_ChiroWithSpeciesName_uniq_COI_5P_20241129.fasta > ref/ref_ChiroWithSpeciesName_uniq_rm230_COI_5P_20241129.fasta
sed '/^>/s/ voucher.*//' ref/ref_ChiroWithSpeciesName_uniq_rm230_COI_5P_20241129.fasta > ref/ref_ChiroWithSpeciesName_uniq_rm230_rename_COI_5P_20241129.fasta
sed '/^>/! s/[^ACGTacgt]/-/g' ref/ref_ChiroWithSpeciesName_uniq_rm230_rename_COI_5P_20241129.fasta > ref/ref_ChiroWithSpeciesName_uniq_rm230_rename_clean_COI_5P_20241129.fasta


### mafft

/home/jordan/Software/mafft-linux64/mafft.bat --nuc --auto --maxiterate 10000 --thread 20 --op 2 --ep 0.1 --lop -2 --lep 0.1 --lexp 0.1 ref/ref_ChiroWithSpeciesName_uniq_rm230_rename_clean_COI_5P_20241129.fasta > mafft_results/ncbi_ref.fasta


### trimAL

/home/jordan/Software/trimAl_Linux_x86-64/trimal -in mafft_results/ncbi_ref.fasta -out trimal_results/ncbi_ref_trimal.fasta -fasta -automated1 -htmlout trimal_results/ncbi_ref_trimal.html


### modeltest

#/home/jordan/Software/modeltest-ng-static-v1.7 -i trimal_results/ncbi_ref_trimal.fasta -d nt -h ugfi -t ml -v -T raxml --force -o modeltest_results/modeltest.result
cd tree
/home/jordan/Software/raxml-ng_v1.2.2_linux_x86_64/raxml-ng --all --msa-format FASTA --threads 20 --msa ../trimal_results/ncbi_ref_trimal.fasta --model GTR+G --bs-trees 2000 --threads 20 --prefix 2024-11-29 --bs-metric tbe --redo
/home/jordan/Software/raxml-ng_v1.2.2_linux_x86_64/raxml-ng --bsconverge --bs-trees 2024-11-29.raxml.bootstraps --threads 20 --bs-cutoff 0.03

### align each sample on ref

for i in A1 A2 A3 A4 A5 A6 A8 A9 A10 A11 A12 B1 B6 C1 C2 C3 D1 D2 D4 D5 D6 S1 S3 S4 S5 S6 S7 S9 S12 S13 S14 S15; do

    seqtk seq -a fastq_merged/${i}_merged_filtered_uni_sort.fastq > fastq_merged/${i}_merged_filtered_uni_sort.fasta
    /home/jordan/Software/mafft-linux64/mafft.bat --addfragments fastq_merged/${i}_merged_filtered_uni_sort.fasta --nuc --keeplength --localpair --thread 20 --op 2 --ep 0.1 --lop -2 --lep 0.1 --lexp 0.1 trimal_results/ncbi_ref_trimal.fasta > align_per_sample/align_${i}_to_ref.fasta

done


### epa-ng

for i in A1 A2 A3 A4 A5 A6 A8 A9 A10 A11 A12 B1 B6 C1 C2 C3 D1 D2 D4 D5 D6 S1 S3 S4 S5 S6 S7 S9 S12 S13 S14 S15; do

    epa-ng --split trimal_results/ncbi_ref_trimal.fasta align_per_sample/align_${i}_to_ref.fasta
    mv -f query.fasta align_per_sample/split/align_${i}_to_ref_onlyquery.fasta
    rm reference.fasta

done

for i in A1 A2 A3 A4 A5 A6 A8 A9 A10 A11 A12 B1 B6 C1 C2 C3 D1 D2 D4 D5 D6 S1 S3 S4 S5 S6 S7 S9 S12 S13 S14 S15; do

    epa-ng --ref-msa trimal_results/ncbi_ref_trimal.fasta --tree 2024-11-29.raxml.support --query align_per+sample/split/align_${i}_to_ref_onlyquery.fasta --model 2024-11-29.raxml.bestModel --redo
    mv epa_result.jplace epa_results/epa_result_${i}.jplace

done