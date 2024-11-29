# Chironomidae meta-barcoding

## 郭美華老師分析

### 分析結果






### 分析流程 1 - ZOUT table

| Script      | Description                      | Status |
|------------|----------------------------------|-----|
| preprocess.sh | - 對 32 個樣站的 raw fastq 進行前處理，包含用 cutadapt 移除 primers，與用 usearch 做 merge, reverse complement 與 filter   | Done |
| otu.sh | - 用 usearch 做 denoise 並生成 otu 與格式整理 | Done |
| visualization.Rmd | - 用 R 做格式整理與用 R package GUniFrac 生成圖片 "rarecurve.pdf" 與 zotu matrix "sample_zotu_matrix_raw.csv" 與標準化後的 "sample_zotu_matrix_norm.csv"，判定可以移除樣站 "A3" "A9" "D6" "S3" "S6" "S9" | Done |


### 分析流程 2 - GAPPA

| Script      | Description                      | Status |
|------------|----------------------------------|---------|
| tidy_ref.sh | - 從 ncbi 下載 Chironomidae DNA fasta (COI-5P)，條件為長度介於 640-660 之間 <br> - 整理下載的 ref.fasta，包含 unique 與去除沒有完整物種名稱的序列  <br> - 使用 mafft 將 ref.fasta 做 MSA，生成 mafft_results/ncbi_ref.fasta <br> - trimAL 對 mafft_results/ncbi_ref.fasta 進行切除，看 trimal_results/ncbi_ref_trimal.html <br> - 用 raxml-ng 建立 phylogenetic tree，生成 2024-11-29.raxml.bootstraps <br> - Performing bootstrap convergence assessment using autoMRE criterion <br> - align query fragments (each sample) to reference，生成 align_per_sample/align_${i}_to_ref.fasta <br> - epa-ng 生成 jplace file 在 epa_results/ 中 <br> - GAPPA | Running |
|  | - 建立 annotation .txt file 方便在 treeviewer 中視覺化 2024-11-29.raxml.bootstraps  | Pending |





