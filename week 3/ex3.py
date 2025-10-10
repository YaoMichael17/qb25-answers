# !/usr/bin/env python3

# Question 3.1

# I think that A01_24, A01_27, A01_62, and A01_63 are derived from the lab strain, as they share similar allele frequencies and have matching nucleotides. 
# The other samples are likely from the wine strain, as they show more distinct genotypes and have many overlapping variant regions.

# Question 3.2

# I wasn't able to generate the gt_long.txt, however the figure should show me if DNA is inherited from one parent or another.

# sample IDs (in order, corresponding to the VCF sample columns)

file = open("/Users/cmdb/qb25-answers/week3/BYxRM_bam/biallelic.vcf")

output= open("/Users/cmdb/qb25-answers/week3/BYxRM_bam/gt_long.txt","w")
sample_ids = ["A01_62", "A01_39", "A01_63", "A01_35", "A01_31",
              "A01_27", "A01_24", "A01_23", "A01_11", "A01_09"]

vcf_file ="/Users/cmdb/qb25-answers/week3/BYxRM_bam/filtered.vcf"




# open the VCF file
for line in file:
    if line.startswith("#"):
        continue
        # split the line into fields by tab, then
    fields = line.strip().split('\t')
    chrom = fields[0]
    pos   = fields[1]
    sample = 9
    for id in sample_ids:
        column = fields[sample]
        sample +=1
        genotype= column.split(':')
        geno= genotype[0]
        if geno == "0":
            gt = "0"
        elif geno == "1":
            gt = "1"
        else:
            continue
        output.write(f"{id}\t{chrom}\t{pos}\{gt}\n")



# RStudio code:

# library(tidyverse)

# genotypes <- read.table("gt_long.txt", names = c("Sample", "Chrom", "Pos", "Genotype"))

# sample <- filter(genotypes, Sample == "A01_62")

# ggplot(sample, aes(x= pos, y=Genotype)) +
#   geom_point(aes(color = (Genotype))) +
#   facet_grid(. ~ Chrom, scales = "free_x", space = "free_x")
#   labs(
#     title = "Chromosome",
#     x = "Genotype",
#     y = "Position"
#   )

# sample IDs (in order, corresponding to the VCF sample columns)



        









#         id = 0
#         for column_name in header:
#             if column_name in sample_ids:
#                 dictionary[column_name] = id
#             id += 1
#         print(dictionary)
#         continue

#     if line.startswith("#"):
#         continue
  

    
#     # split the line into fields by tab, then
#     fields = line.strip().split('\t')
#     chrom = fields[0]
#     pos   = fields[1]
    
#     # for each sample in sample_ids:
#     for i in sample_ids:
#         id = dictionary[i]
#         sample = fields[id]
#         genotype= sample.split(':')[0]
#         # get the sample's data from fields[9], fields[10], ...
#         # genotypes are represented by the first value before ":" in that sample's data
#         # if genotype is "0" then print "0"
#         # if genotype is "1" then print "1"
#         # otherwise skip
#         if genotype == "0/0":
#             g = "0"
#         elif genotype == "1/1":
#             g = "1"
#         else:
#             continue
        
#         print(f"Writing: {i}\t{chrom}\t{pos}\t{g}")

#         output.write(f"{i}\t{chrom}\t{pos}\t{g}\n")        


    
# output.close()

