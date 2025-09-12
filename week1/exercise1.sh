mkdir week1
conda activate qb25
wget https://hgdownload.soe.ucsc.edu/goldenPath/hg19/bigZips/hg19.chrom.sizes
grep -v _ hg19.chrom.sizes | sed 's/M/MT/' > hg19-main.chrom.sizes
bedtools makewindows
bedtools makewindows -g hg19-main.chrom.sizes -w 1000000 > hg19-1mb.bed
cut -f1-3,5 hg19-kc.tsv > hg19-kc.bed
bedtools intersect -c -a hg19-1mb.bed -b hg19-kc.bed > hg19-kc-count.bed
