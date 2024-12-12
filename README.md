# Chironomidae Meta-barcoding
- PI: 郭美華老師
- 簡單的 Material and Methods 會寫在 03.MM 中

<br>


### 分析流程 1 - ZOUT table

- 此處的分析目的為生成 Sample-ZOTU 的 matrix 與圖片，結果儲存在 /01.ZOTU_Results/ 中

| Script      | 處理過程                      | 狀態 |
|------------|----------------------------------|-----|
| preprocess.sh | - 對 32 個樣站的 raw fastq（fastq）進行前處理，包含用 cutadapt 移除 primers，與用 usearch 做 merge, reverse complement 與 filter ，結果在 /01.ZOTU_Results/fastq_trimmed 與 /01.ZOTU_Results/fastq_merged 中）   |  Done  |
| otu.sh | - 用 usearch 做 denoise 並生成 otu 與格式整理，結果為 /01.ZOTU_Results/zotus.fa、/01.ZOTU_Results/unoise3_result.txt、/01.ZOTU_Results/zotutab97.txt、/01.ZOTU_Results/zmap97.txt 與 /01.ZOTU_Results/zmap97_tidy.txt | Done |
| visualization.Rmd | - 用 R 做格式整理與用 R package GUniFrac 生成圖片 /01.ZOTU_Results/rarecurve.pdf ，與 zotu matrix /01.ZOTU_Results/sample_zotu_matrix_raw.csv 。 <br> - 生成標準化後的 /01.ZOTU_Results/sample_zotu_matrix_norm.csv，判定可以移除樣站 "A3" "A9" "D6" "S3" "S6" "S9"？ | Done |
| visualization.Rmd | - plots: Alpha Diversity, PCoA, Heatmap, and clustering relative abundance (barplot+dendrogram)  都在 /01.ZOTU_Results/ 中 | Done  |

<br>
<br>

### 分析流程 2 - Assign Taxonomy to ZOTU

- 此處的分析目的為訓練 RDP classifier 並分類所有 ZOTU，結果儲存在 /02.Classifier_Results/ 中
- ncbi search term: `(((((("Arthropoda"[Organism] OR Arthropoda[All Fields]) OR ("Annelida"[Organism] OR Annelida[All Fields])) OR ("Nematoda"[Organism] OR Nematoda[All Fields])) OR ("Platyhelminthes"[Organism] OR Platyhelminthes[All Fields])) OR ("Myxozoa"[Organism] OR Myxozoa[All Fields])) NOT sp.[All Fields]) AND COI[All Fields] AND ("640"[SLEN] : "660"[SLEN])`
- 02.Classifier_Results 整個資料夾會另外給予（請自 http://gofile.me/6zAKe/BIALgNMTa 下載）

| Script      | 處理過程                      | 狀態 |
|------------|----------------------------------|-----|
| tidy_ref.Rmd | - 整理 ncbi 下載 641655 個序列的 /02.Classifier_Results/ref/sequence.gb，儲存為 /02.Classifier_Results/ref/taxonomy_tidy.txt 與 /02.Classifier_Results/taxonomy_tidy_IDs.txt，內有分類資訊。 <br> - 去除 convergent evolution |  Done  |
| train.sh  | - 根據整理好的 /02.Classifier_Results/ref/taxonomy_tidy.txt 篩選 /02.Classifier_Results/ref/sequence.fasta，只留下有完整分類資訊的序列 （/02.Classifier_Results/ref/tidy_extract.fasta） |  Done  |
| train.sh  | - 用工具去整理 /02.Classifier_Results/ref/taxonomy_tidy.txt 與 /02.Classifier_Results/ref/tidy_extract.fasta 格式，使其可以被訓練成 rdp classifier |  Done  |
| train.sh  | - train RDP classifier，生成 /02.Classifier_Results/rdp_training 資料夾 |  Done  |
| classify.sh  | - 利用訓練好的 RDP classifier 去對 /01.ZOTU_Results/zotu.fa 進行分類，結果為 /02.Classifier_Results/zotu_taxonomy.txt  |  Done  |
| visualization.Rmd  | - 根據分類結果（/02.Classifier_Results/zotu_taxonomy.txt）進行視覺化，生成 /02.Classifier_Results/\*mtx.csv、/02.Classifier_Results/\*.pdf，與 /02.Classifier_Results/\*.csv |  Done  |

<br>
<br>


### 其他

| Script      | Description                      | Status |
|------------|----------------------------------|---------|
|  | - 撰寫相關 mateirals and methods 在 03.MM | Pending |

