# sort chr1_hg19 | uniq -c | sort -n | sort -r > snp_chr1_count 
# head -n 3 snp_chr1_count 
#    6 chr1	145209190	145209191	rs782620697	0	+
#    6 chr1	145209152	145209155	rs144013425	0	+
#    6 chr1	144340161	144340162	rs782656194	0	+

# For the gene that has the most SNPs, its systematic name  is ENSG00000308729 and ENSG00000301230, human readable name: notch 2 N-terminal like B, transcript variant 3, position hg19 chr1: 145,209,190-145,209,191 size: 73,903 , exon count: 12
# I think this gene has the most SNPs due to a higher mutation rate caused by selective pressure associated with the chromatin state of an active promoter.
# bedtools sample -n 20 -seed 42 -i snps-chr1.bed > snps-chr1-subset.bed
# bedtools sort -i snps-chr1-subset.bed > snps-chr1-subset-sort.bed
# bedtools sort -i hg19-kc.bed > hg19-kc-sort.bed
# bedtools closest -a snps-chr1-subset-sort.bed -b hg19-kc-sort.bed -d -t first > snps-chr1-hg19-closest.bed
# wc snps-chr1-hg19-closest.bed 
#       20     220    1694 snps-chr1-hg19-closest.bed

# How many SNPs are inside of a gene?
# =20

# what is the range of distance for ones outside a gene?
# sort -n snps-chr1-hg19-closest.bed > outside
# head -n 1 outside
# chr1	11638083	11638084	rs6698664	0	+	chr1	11653741	11655507	ENST00000793460.1_2	15658
# head -n 1 snps-chr1-hg19-closest.bed 
# chr1	3810505	3810506	rs78397137	0	+	chr1	3805696	3816836	ENST00000361605.4_7	0

# range= 11638083-3810506= 7827577

