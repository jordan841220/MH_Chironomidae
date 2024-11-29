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
ref/ref_ChiroWithSpeciesName_uniq_rm230_rename_COI_5P_20241129.fasta
sed '/^>/! s/[^ACGTacgt]/-/g' ref/ref_ChiroWithSpeciesName_uniq_rm230_rename_COI_5P_20241129.fasta > ref/ref_ChiroWithSpeciesName_uniq_rm230_rename_clean_COI_5P_20241129.fasta


/home/jordan/Software/mafft-linux64/mafft.bat --nuc --auto --maxiterate 10000 --thread 20 --op 2 --ep 0.1 --lop -2 --lep 0.1 --lexp 0.1 ref/ref_ChiroWithSpeciesName_uniq_rm230_rename_clean_COI_5P_20241129.fasta > mafft_results/ncbi_ref.fasta
/home/jordan/Software/mafft-linux64/mafft.bat --add zotus.fa --nuc --maxiterate 10000 --auto --thread 20 --op 2 --ep 0.1 --lop -2 --lep 0.1 --lexp 0.1 mafft_results/ncbi_ref.fasta > mafft_results/aligned.fasta




### tidy ref

cat NCBI_COI_Chiro.fasta | seqkit grep -n -r -p sp\\. -v > NCBI_COI_Chiro_nosp.fasta

usearch -fastx_uniques NCBI_COI_Chiro_nosp.fasta -fastaout NCBI_COI_Chiro__nosp_withsize.fasta -sizeout


### MSA

cat NCBI_COI_Chiro__nosp_withsize.fasta zotus.fa > sequences.fasta

muscle -super5 sequences.fasta -output aln.@.afa -perm all -threads 50