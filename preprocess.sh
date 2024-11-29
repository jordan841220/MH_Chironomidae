#!/bin/bash

source activate /mnt/space4/jordan-env/bin

primer1F="CACgTCTAgCHCCHgAYATRgCHTTYCC"
primerR="TCDggRTgNCCRAARAAYCA"
primer2F="AgCTAgTggCHCCHgAYATRgCHTTYCC"
primer3F="ACTATCgCgCHCCHgAYATRgCHTTYCC"
primer4F="ACTCTCCAgCHCCHgAYATRgCHTTYCC"
primer5F="CgTCCATTgCHCCHgAYATRgCHTTYCC"
primer6F="AgCCgTAAgCHCCHgAYATRgCHTTYCC"
primerA2F="gCHCCHgAYATRgCHTTYCC"

wkdir="/home/jordan/projects/Chiro"
cd "${wkdir}"


for sample in A1 B6 D2 S9; do

    cutadapt -g "^${primer1F};max_error_rate=0.05" \
    -G "^${primerR};max_error_rate=0.05" \
    -o "fastq_trimmed/${sample}_R1_F.fastq" -p "fastq_trimmed/${sample}_R2_R.fastq" "fastq/${sample}_R1.fastq" "fastq/${sample}_R2.fastq" --discard-untrimmed -j 0 2> "fastq_trimmed/summary_${sample}.txt"
    
    cutadapt -g "^${primerR};max_error_rate=0.05" \
    -G "^${primer1F};max_error_rate=0.05" \
    -o "fastq_trimmed/${sample}_R1_R.fastq" -p "fastq_trimmed/${sample}_R2_F.fastq" "fastq/${sample}_R1.fastq" "fastq/${sample}_R2.fastq" --discard-untrimmed -j 0 2> "fastq_trimmed/summary_${sample}.txt"


done

for sample in A10 C1 D4 S4 S12 S3; do

    cutadapt -g "^${primer2F};max_error_rate=0.05" \
    -G "^${primerR};max_error_rate=0.05" \
    -o "fastq_trimmed/${sample}_R1_F.fastq" -p "fastq_trimmed/${sample}_R2_R.fastq" "fastq/${sample}_R1.fastq" "fastq/${sample}_R2.fastq" --discard-untrimmed -j 0 2> "fastq_trimmed/summary_${sample}.txt"
    
    cutadapt -g "^${primerR};max_error_rate=0.05" \
    -G "^${primer2F};max_error_rate=0.05" \
    -o "fastq_trimmed/${sample}_R1_R.fastq" -p "fastq_trimmed/${sample}_R2_F.fastq" "fastq/${sample}_R1.fastq" "fastq/${sample}_R2.fastq" --discard-untrimmed -j 0 2> "fastq_trimmed/summary_${sample}.txt"

done

for sample in A4 A11 C2 D5 S5 S13 S6; do

    cutadapt -g "^${primer3F};max_error_rate=0.05" \
    -G "^${primerR};max_error_rate=0.05" \
    -o "fastq_trimmed/${sample}_R1_F.fastq" -p "fastq_trimmed/${sample}_R2_R.fastq" "fastq/${sample}_R1.fastq" "fastq/${sample}_R2.fastq" --discard-untrimmed -j 0 2> "fastq_trimmed/summary_${sample}.txt"
    
    cutadapt -g "^${primerR};max_error_rate=0.05" \
    -G "^${primer3F};max_error_rate=0.05" \
    -o "fastq_trimmed/${sample}_R1_R.fastq" -p "fastq_trimmed/${sample}_R2_F.fastq" "fastq/${sample}_R1.fastq" "fastq/${sample}_R2.fastq" --discard-untrimmed -j 0 2> "fastq_trimmed/summary_${sample}.txt"

done

for sample in A5 A12 C3 S14 A3; do

    cutadapt -g "^${primer4F};max_error_rate=0.05" \
    -G "^${primerR};max_error_rate=0.05" \
    -o "fastq_trimmed/${sample}_R1_F.fastq" -p "fastq_trimmed/${sample}_R2_R.fastq" "fastq/${sample}_R1.fastq" "fastq/${sample}_R2.fastq" --discard-untrimmed -j 0 2> "fastq_trimmed/summary_${sample}.txt"
    
    cutadapt -g "^${primerR};max_error_rate=0.05" \
    -G "^${primer4F};max_error_rate=0.05" \
    -o "fastq_trimmed/${sample}_R1_R.fastq" -p "fastq_trimmed/${sample}_R2_F.fastq" "fastq/${sample}_R1.fastq" "fastq/${sample}_R2.fastq" --discard-untrimmed -j 0 2> "fastq_trimmed/summary_${sample}.txt"

done

for sample in A6 B1 D1 S1 S7 S15 D6; do

    cutadapt -g "^${primer5F};max_error_rate=0.05" \
    -G "^${primerR};max_error_rate=0.05" \
    -o "fastq_trimmed/${sample}_R1_F.fastq" -p "fastq_trimmed/${sample}_R2_R.fastq" "fastq/${sample}_R1.fastq" "fastq/${sample}_R2.fastq" --discard-untrimmed -j 0 2> "fastq_trimmed/summary_${sample}.txt"
    
    cutadapt -g "^${primerR};max_error_rate=0.05" \
    -G "^${primer5F};max_error_rate=0.05" \
    -o "fastq_trimmed/${sample}_R1_R.fastq" -p "fastq_trimmed/${sample}_R2_F.fastq" "fastq/${sample}_R1.fastq" "fastq/${sample}_R2.fastq" --discard-untrimmed -j 0 2> "fastq_trimmed/summary_${sample}.txt"

done

for sample in A8 A9; do

    cutadapt -g "^${primer6F};max_error_rate=0.05" \
    -G "^${primerR};max_error_rate=0.05" \
    -o "fastq_trimmed/${sample}_R1_F.fastq" -p "fastq_trimmed/${sample}_R2_R.fastq" "fastq/${sample}_R1.fastq" "fastq/${sample}_R2.fastq" --discard-untrimmed -j 0 2> "fastq_trimmed/summary_${sample}.txt"
    
    cutadapt -g "^${primerR};max_error_rate=0.05" \
    -G "^${primer6F};max_error_rate=0.05" \
    -o "fastq_trimmed/${sample}_R1_R.fastq" -p "fastq_trimmed/${sample}_R2_F.fastq" "fastq/${sample}_R1.fastq" "fastq/${sample}_R2.fastq" --discard-untrimmed -j 0 2> "fastq_trimmed/summary_${sample}.txt"

done

for sample in A2; do

    cutadapt -g "^${primerA2F};max_error_rate=0.05" \
    -G "^${primerR};max_error_rate=0.05" \
    -o "fastq_trimmed/${sample}_R1_F.fastq" -p "fastq_trimmed/${sample}_R2_R.fastq" "fastq/${sample}_R1.fastq" "fastq/${sample}_R2.fastq" --discard-untrimmed -j 0 2> "fastq_trimmed/summary_${sample}.txt"
    
    cutadapt -g "^${primerR};max_error_rate=0.05" \
    -G "^${primerA2F};max_error_rate=0.05" \
    -o "fastq_trimmed/${sample}_R1_R.fastq" -p "fastq_trimmed/${sample}_R2_F.fastq" "fastq/${sample}_R1.fastq" "fastq/${sample}_R2.fastq" --discard-untrimmed -j 0 2> "fastq_trimmed/summary_${sample}.txt"

done

###############
#### merge ####
###############

cd "${wkdir}/fastq_trimmed"
gzip -d *.fastq.gz
cd "${wkdir}"

for sample in A1 B6 D2 S9 A2 A8 A9 A6 B1 D1 S1 S7 S15 D6 A5 A12 C3 S14 A3 A4 A11 C2 D5 S5 S13 S6 A10 C1 D4 S4 S12 S3; do

    usearch -fastq_mergepairs "fastq_trimmed/${sample}_R1_F.fastq" \
    -reverse "fastq_trimmed/${sample}_R2_R.fastq" \
    -fastqout "fastq_merged/${sample}_F_merged.fastq" \
    -fastq_trunctail 20 -fastq_minlen 100 -fastq_maxdiffs 10 -fastq_pctid 95 -fastq_minovlen 50 -fastq_minmergelen 410 -fastq_maxmergelen 430 -tabbedout "fastq_merged/${sample}_F_MergeProcess.txt"
    
    usearch -fastq_mergepairs "fastq_trimmed/${sample}_R1_R.fastq" \
    -reverse "fastq_trimmed/${sample}_R2_F.fastq" \
    -fastqout "fastq_merged/${sample}_R_merged.fastq" \
    -fastq_trunctail 20 -fastq_minlen 100 -fastq_maxdiffs 10 -fastq_pctid 95 -fastq_minovlen 50 -fastq_minmergelen 410 -fastq_maxmergelen 430 -tabbedout "fastq_merged/${sample}_R_MergeProcess.txt"
    

    usearch -fastx_revcomp "fastq_merged/${sample}_R_merged.fastq" -fastqout "fastq_merged/${sample}_R_merged_rc.fastq"
    
    cat "fastq_merged/${sample}_F_merged.fastq" "fastq_merged/${sample}_R_merged_rc.fastq" > "fastq_merged/${sample}_merged.fastq"
    
    usearch -fastq_filter "fastq_merged/${sample}_merged.fastq" -fastqout "fastq_merged/${sample}_merged_filtered.fastq" -fastq_maxee 0.5
    usearch -fastx_uniques "fastq_merged/${sample}_merged_filtered.fastq" -fastqout "fastq_merged/${sample}_merged_filtered_uni.fastq" -strand both -sizeout -relabel sample=${sample}.
    usearch -sortbysize "fastq_merged/${sample}_merged_filtered_uni.fastq" -fastqout "fastq_merged/${sample}_merged_filtered_uni_sort.fastq" -minsize 10
    
    fastqc "fastq_merged/${sample}_merged_filtered_uni_sort.fastq" -o fastq_merged

done

cat fastq_merged/*_merged_filtered_uni_sort.fastq > fastq_merged/merged_filtered_uni_unsort.fastq
usearch -sortbysize fastq_merged/merged_filtered_uni_unsort.fastq -fastqout fastq_merged/merged_filtered_uni_sort.fastq



