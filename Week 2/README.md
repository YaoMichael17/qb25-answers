bowtie2 -p 4 -x ../genomes/sacCer3 -U ~/Data/BYxRM/fastq/A01_01.fq.gz > A01.01.sam

samtools sort -o A01.01.bam A01.01.sam 

samtools index A01.01.bam

samtools idxstats A01.01.bam > A01_01.idxstats 

Question 2
For sample A01_03, A01_05, A01_02 and A01_06 I see similar patterns in their SNPs and coverage while sample A01_01 and A01_04 shows different patterns and coverage.  
At the location 27915_chr01, both A01_01 and A01_04 have the nucleotide C, which corresponds to R in the haplotypes text file. Meaning that sample 01 and 04 are RM haplotype while sample 02,03,05, and 06 are BY haplotype. 

Question 4
minimap2 -ax map-ont sacCer3.fa ERR8562478.fastq > longreads.sam


Question 5
hisat2 -p 4 -x sacCer3 -U SRR10143769.fastq -S His.sam 

what part of the genes appear to have the most coverage?
regions between 31,239 bp and 31,697 have alot of gene coverage with the highest at 31,473 bp. 
The higher coverage towards thhe 3' end of the gene is consistent with rna sequences as the 3' end contains the poly-A tail and complementary sequence for microRNA pairing and stability.

