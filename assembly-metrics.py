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
         print(f"sequence length of the shortest contig at 50% of the total assembly length:",{i})
         break 




# print(f"Number_of_contigs: {Number_of_contigs}")
# print(f"Total_length: {Total_length}")
# Average_length= Total_length/Number_of_contigs
# print(f"Average_length: {Average_length}")





# print(my_file)

# my_file = open( sys.argv[1] )


# for ident, sequence in assemblies:
#     print( f"Name: {ident}" )
#     print( f”First 20 nucleotides: {sequence[:20]}" )

