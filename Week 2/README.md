bowtie2 -p 4 -x ../genomes/sacCer3 -U ~/Data/BYxRM/fastq/A01_01.fq.gz > A01.01.sam

samtools sort -o A01.01.bam A01.01.sam 

samtools index A01.01.bam

samtools idxstats A01.01.bam > A01_01.idxstats 

For A01_01 bam coverage I see that it shows gene coverage and matching BYxRM around 28,400bp to 29,325 bp. With higher A and T counts around 28,400 bp.
For A01_02 bam coverage the gene coverage is throughout the chrl region. With high counts around 27,273, 30,496, and 31,907.
For A01_03 bam coverage, there is an overall lower amount of gene coverage with only a high amount of coverage around 31,716.
For A01_04 bam coverage, there is coverage around 27,500 bo to 29,500 bp and 31,000 bp to 32,000 bp. 
For A01_05 bam coverage, I see gene coverage throughout the chrl, with the highest gene coverage around 24,279 with a count of 18 Ts. 
For A01_06 bam coverage, there is an largest amount of gene coverage throughout the chrl with highest point around 30,545.


Question 4
minimap2 -ax map-ont sacCer3.fa ERR8562478.fastq > longreads.sam


Question 5
hisat2 -x sacCer3 -U SRR10143769.fastq -S His.sam 

what part of the genes appear to have the most coverage?
regions between 31,239 bp and 31,697 have alot of gene coverage with the highest at 31,473 bp. 