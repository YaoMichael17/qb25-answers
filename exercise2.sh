# bedtools intersect -c -a hg16-1mb.bed -b hg16-kc.bed > hg16-kc-count.bed
# wc hg16-kc-count.bed 
#     3085   12340   80438 hg16-kc-count.bed
# wc hg16-kc-count.bed 
#     3085   12340   80438 hg16-kc-count.bed
# wc hg19-kc-count.bed 
#     3114   12456   83076 hg19-kc-count.bed
# bedtools intersect -v -a hg19-kc-count.bed -b hg16-kc-count.bed > hg19-hg16-difference
# wc hg19-hg16-difference 
#       36     144     969 hg19-hg16-difference
# bedtools intersect -v -a hg16-kc-count.bed -b hg19-kc-count.bed > hg16-hg19-difference
# wc hg16-hg19-difference 
#        7      28     178 hg16-hg19-difference


# How many genes are in hg19= 3114 
# How many genes are in hg19 but not in hg16? = 36
# Why are some genes in hg19 but not in hg16?= Since hg19 is a newer dataset, it may include genes that weren't identified during the hg16 assembly.

# How many genes are in hg16=  3085 
# How many genes are in hg16 but not in hg19? = 7
# Why are some genes in hg16 but not in hg19= This difference may be due to a better understanding of the human genome, leading to the removal of genes that were previously misannotated or identified.