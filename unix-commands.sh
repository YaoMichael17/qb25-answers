#1. 
wc ce11_genes.bed 
   #53935  323610 2200094 ce11_genes.bed

#How many features: 53935

cut -f 1 ce11_genes.bed | uniq -c
# How many features per chr:
# 5460 chrI
#   12 chrM
# 9057 chrV
# 6840 chrX
# 6299 chrII
# 21418 chrIV
# 4849 chrIII

grep + ce11_genes.bed | wc
#    27309
grep - ce11_genes.bed | wc
#    26626
# How many features per strand
# +=27309
# -=26626

#3. 
cut -f 7 GTEx_Analysis_v8_Annotations_SampleAttributesDS.txt| sort | uniq -c | sort -r | head -n 3
# Which three SMTSDs (Tissue Site Detail) have the most samples :
# 3288 Whole Blood
# 1132 Muscle - Skeletal
#  867 Lung

cut -f 12 GTEx_Analysis_v8_Annotations_SampleAttributesDS.txt | grep RNA | wc
   # 20016  117213  947910




