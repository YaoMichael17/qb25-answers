# My Project
Mini-Project – Calculate Assembly Metrics

-https://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS19/species/caenorhabditis_remanei/PRJNA248909/caenorhabditis_remanei.PRJNA248909.WBPS19.genomic.fa.gz

-https://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS19/species/caenorhabditis_remanei/PRJNA248911/caenorhabditis_remanei.PRJNA248911.WBPS19.genomic.fa.gz

-https://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS19/species/caenorhabditis_remanei/PRJNA53967/caenorhabditis_remanei.PRJNA53967.WBPS19.genomic.fa.gz

-https://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS19/species/caenorhabditis_remanei/PRJNA577507/caenorhabditis_remanei.PRJNA577507.WBPS19.genomic.fa.gz



Question number 4

python code:

#!/usr/bin/env python3

import sys
import fasta

my_file= open(sys.argv[1])
contigs = fasta.FASTAReader( my_file )

Number_of_contigs = 0
Total_length= 0

for  ident, sequence in contigs:
    Number_of_contigs += 1
    Total_length +=len(sequence)


print(f"Number_of_contigs: {Number_of_contigs}")
print(f"Total_length: {Total_length}")
Average_length= Total_length/Number_of_contigs
print(f"Average_length: {Average_length}")

Unix:

conda activate qb25     
wget https://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS19/species/caenorhabditis_remanei/PRJNA248909/caenorhabditis_remanei.PRJNA248909.WBPS19.genomic.fa.gz
wget https://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS19/species/caenorhabditis_remanei/PRJNA248911/caenorhabditis_remanei.PRJNA248911.WBPS19.genomic.fa.gz
wget https://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS19/species/caenorhabditis_remanei/PRJNA53967/caenorhabditis_remanei.PRJNA53967.WBPS19.genomic.fa.gz
wget https://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS19/species/caenorhabditis_remanei/PRJNA577507/caenorhabditis_remanei.PRJNA577507.WBPS19.genomic.fa.gz
gunzip *.gz

./assembly-metrics.py caenorhabditis_remanei.PRJNA248909.WBPS19.genomic.fa 
./assembly-metrics.py caenorhabditis_remanei.PRJNA248911.WBPS19.genomic.fa   
./assembly-metrics.py caenorhabditis_remanei.PRJNA53967.WBPS19.genomic.fa 
./assembly-metrics.py caenorhabditis_remanei.PRJNA577507.WBPS19.genomic.fa 

Summary of results:

-https://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS19/species/caenorhabditis_remanei/PRJNA248909/caenorhabditis_remanei.PRJNA248909.WBPS19.genomic.fa.gz
Number_of_contigs: 1591
Total_length: 118549266
Average_length: 74512.42363293526

https://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS19/species/caenorhabditis_remanei/PRJNA248911/caenorhabditis_remanei.PRJNA248911.WBPS19.genomic.fa.gz
Number_of_contigs: 912
Total_length: 124541912
Average_length: 136559.11403508772

https://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS19/species/caenorhabditis_remanei/PRJNA53967/caenorhabditis_remanei.PRJNA53967.WBPS19.genomic.fa.gz
Number_of_contigs: 3670
Total_length: 145442736
Average_length: 39630.17329700272

https://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS19/species/caenorhabditis_remanei/PRJNA577507/caenorhabditis_remanei.PRJNA577507.WBPS19.genomic.fa.gz
Number_of_contigs: 187
Total_length: 130480874
Average_length: 697758.6844919786


Question number 5

python code:

#!/usr/bin/env python3

import sys
import fasta

my_file= open(sys.argv[1])
contigs = fasta.FASTAReader( my_file )

Number_of_contigs = 0
Total_length= 0
N50= [] 

for  ident, sequence in contigs:
    Number_of_contigs += 1
    Total_length +=len(sequence)
    N50.append(len(sequence))
N50.sort( reverse=True)

C_length = 0 
for i in N50:
    print(i)
    C_length += i
    if C_length >= 0.5*(Total_length):
        #  print(f"sequence length of the shortest contig at 50% of the total assembly length:",{i})
         break 

Unix:

./assembly-metrics.py caenorhabditis_remanei.PRJNA248909.WBPS19.genomic.fa 

./assembly-metrics.py caenorhabditis_remanei.PRJNA248911.WBPS19.genomic.fa 

./assembly-metrics.py caenorhabditis_remanei.PRJNA53967.WBPS19.genomic.fa 

./assembly-metrics.py caenorhabditis_remanei.PRJNA577507.WBPS19.genomic.fa 


Summary of results:

sequence length of the shortest contig at 50% of the total assembly length: {1522088}

sequence length of the shortest contig at 50% of the total assembly length: {1765890}

sequence length of the shortest contig at 50% of the total assembly length: {435512}

sequence length of the shortest contig at 50% of the total assembly length: {21501900}

