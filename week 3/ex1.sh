#!/bin/bash

# for sample in A01_01 A01_02 A01_03 A01_04 A01_05 A01_06
# do
#     #do use a varible use a prefix of $
#     echo "***" $sample
#     ls -l ~/Data/BYxRM/fastq/$sample.fq.gz
#     samtools view -bS $sample.sam | 
#     samtools sort -o $sample.bam $sample.sam
#     samtools index $sample.bam

# done


for i in bamListFile.txt:

# run FreeBayes to discover variants
freebayes -f sacCer3.fa -L bamListFile.txt --genotype-qualities -p 2 > unfiltered.vcf

# the resulting VCF file is unfiltered, meaning that it contains low-confidence calls and also has some quirky formatting, so the following steps use a software suite called vcflib to clean up the VCF

# filter the variants based on their quality score and remove sites where any sample had missing data
vcffilter -f "QUAL > 20" -f "AN > 9" unfiltered.vcf > filtered.vcf

# FreeBayes has a quirk where it sometimes records haplotypes rather than individual variants; we want to override this behavior
vcfallelicprimitives -kg filtered.vcf > decomposed.vcf

# in very rare cases, a single site may have more than two alleles detected in your sample; while these cases may be interesting, they may also reflect technical errors and also pose a challenge for parsing the data, so we remove them
vcfbreakmulti decomposed.vcf > biallelic.vcf