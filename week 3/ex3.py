#!/usr/bin/env python3

# Question 3.1

# I think that A01_24, A01_27, A01_62, and A01_63 are derived from the lab strain, as they share similar allele frequencies and have matching nucleotides. 
# The other samples are likely from the wine strain, as they show more distinct genotypes and have many overlapping variant regions.



# sample IDs (in order, corresponding to the VCF sample columns)
sample_ids = ["A01_62", "A01_39", "A01_63", "A01_35", "A01_31",
              "A01_27", "A01_24", "A01_23", "A01_11", "A01_09"]

vcf_file = "/Users/cmdb/qb25-answers/week3/BYxRM_bam/unfiltered.vcf"
output_file = "gt_long.txt"

dictionary= {}

output = open(output_file, "w")

# open the VCF file
for line in open(vcf_file):
    if line.startswith("#"):
        continue
    if line.startswith("#CHROM"):
        header= line.strip().split('\t')

        id = 0
        for column_name in header:
            if column_name in sample_ids:
                dictionary[column_name] = id
            id += 1
        continue
    if not dictionary:
        continue

    
    # split the line into fields by tab, then
    fields = line.strip().split('\t')
    chrom = fields[0]
    pos   = fields[1]
    
    # for each sample in sample_ids:
    for i in sample_ids:
        id = dictionary[i]
        sample = fields[id]
        genotype= i.split(':')[0]
        # get the sample's data from fields[9], fields[10], ...
        # genotypes are represented by the first value before ":" in that sample's data
        # if genotype is "0" then print "0"
        # if genotype is "1" then print "1"
        # otherwise skip
        if genotype == "0/0":
            g = "0"
        elif genotype == "1/1":
            g = "1"
        else:
            continue

        output.write(f"{sample}\t{chrom}\t{pos}\t{g}\n")
        

    
         