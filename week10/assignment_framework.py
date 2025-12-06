#!/usr/bin/env python3

import sys

import numpy as np

from fasta import readFASTA



#====================#
# Read in parameters #
#====================#

fasta_file = sys.argv[1]
sigma_file = sys.argv[2]
gap_penalty= int(sys.argv[3])
out_file = sys.argv[4]

# The scoring matrix is assumed to be named "sigma_file" and the 
# output filename is assumed to be named "out_file" in later code


# Read the scoring matrix into a dictionary
sigma = {}
with open(sigma_file) as fs:
     alphabet = fs.readline().strip().split()
     for line in fs:
        line = line.rstrip().split()
        for i in range(1, len(line)):
             sigma[(alphabet[i - 1], line[0])] = float(line[i])

# Read in the actual sequences using readFASTA

input_sequences = readFASTA(open(fasta_file))

seq1_id, sequence1 = input_sequences[0]
seq2_id, sequence2 = input_sequences[1]
#=====================#
# Initialize F matrix #
#=====================#
m=len(sequence1)
n=len(sequence2)
f_matrix = np.zeros((m+1, n+1), dtype = float)
traceback= np.zeros((m+1, n+1), dtype = int)

print(m)
print(n)

for i in range(1, m+1): 
    f_matrix[i,0] = f_matrix[i-1,0] +gap_penalty
    traceback[i,0] = 2

for j in range(1, n+1):
    f_matrix[0,j]= f_matrix[0, j-1] +gap_penalty
    traceback[0,j] = 3

#=============================#
# Initialize Traceback Matrix #
#=============================#



#===================#
# Populate Matrices #
#===================#
##########

      
for i in range(1, m+ 1):
    for j in range(1, n+ 1):
        v_score = gap_penalty +f_matrix[i-1, j]
        h_score = gap_penalty +f_matrix[i, j-1]
        d_score = sigma[(sequence1[i-1],sequence2[j-1])] + f_matrix[i-1,j-1]
        #asked help from chatgpt to understand to add the score of mismatching from dictionary to our previous alignment scores.
        f_matrix[i,j] =  max(v_score ,h_score, d_score)
        #1 = diagonal , 2= up direction, 3= left direction. Recording the traceback moving from bottom right to top left
        if f_matrix[i,j] == d_score:
            traceback[i,j] = 1 
        elif f_matrix[i,j] == v_score:
            traceback[i,j] = 2  
        else:
            traceback[i,j] = 3 
            
print(d_score)
#========================================#
# Follow traceback to generate alignment #
#========================================#
#########
sequence1_alignment= []
sequence2_alignment= []
#to start the count from the bottom right.

# The aligned sequences are assumed to be strings named sequence1_aligment
# and sequence2_alignment in later code
#Using the while loop from lesson and chatgpt
#So that the code continues until we reach top left
i= m
j= n

while i> 0 or j > 0 :
    print(i)
    print(j)
    #to align characters without a gap and moving diagonally up 
    if traceback[i,j] ==1:
        sequence1_alignment.append(sequence1[i-1])
        sequence2_alignment.append(sequence2[j-1])
        #to move diagonally up left
        i -= 1
        j-= 1
    #To move up while aligning a character in sequence 1 but a gap in sequence 2 
    elif traceback[i,j] == 2:
          sequence1_alignment.append(sequence1[i-1])
          sequence2_alignment.append("-")
          i-= 1
    #now doing so moving left to align character for sequence 2 but a gap for sequence 1
    elif traceback[i,j] == 3:
          sequence1_alignment.append("-")
          sequence2_alignment.append(sequence2[j-1])
          j-= 1
#[::-1] is to reverse the backward list, "".join() is to convert the lists of characters into strings for each aligned sequence.
sequence1_alignment = "".join(sequence1_alignment[::-1])
sequence2_alignment = "".join(sequence2_alignment[::-1])

print("Sequence1 alignment:", sequence1_alignment)
print("Sequence2 alignment:", sequence2_alignment)

alignment_score = f_matrix[m,n]
gap_counts_seq1 = sequence1_alignment.count("-")
gap_counts_seq2 = sequence2_alignment.count("-")


print(alignment_score)
print(gap_counts_seq1)
print(gap_counts_seq2)

with open(out_file, "w") as f:
    f.write(sequence1_alignment + "\n")
    f.write(sequence2_alignment + "\n")

#=================================#
# Generate the identity alignment #
#=================================#
# for i in range(1,len(sequence1)+ 1):
#     f_matrix[i,0] = f_matrix[i-1, 0] +gap_penalty
# This is just the bit between the two aligned sequences that
# denotes whether the two sequences have perfect identity
# at each position (a | symbol) or not.

# identity_alignment = ''
# for i in range(len(sequence1_alignment)):
# 	if sequence1_alignment[i] == sequence2_alignment[i]:
# 		identity_alignment += '|'
# 	else:
# 		identity_alignment += ' '


#===========================#
# Write alignment to output #
#===========================#
#######
# counting_gaps_seq1= sequence1_alignment.count("-")
# counting_gaps_seq2= sequence2_alignment.count("-")

# print("Number of gaps in sequence1:", counting_gaps_seq1)
# print("Number of gaps in sequence2:", counting_gaps_seq2)

# Certainly not necessary, but this writes 100 positions at
# a time to the output, rather than all of it at once.

# output = open(out_file, 'w')

# for i in range(0, len(identity_alignment), 100):
# 	output.write(sequence1_alignment[i:i+100] + '\n')
# 	output.write(identity_alignment[i:i+100] + '\n')
# 	output.write(sequence2_alignment[i:i+100] + '\n\n\n')


#=============================#
# Calculate sequence identity #
#=============================#


#======================#
# Print alignment info #
# #======================#

####
# alignment_score = f_matrix[len(sequence1), len(sequence2)]
# print("Alignment score:", alignment_score)


# # You need the number of gaps in each sequence, the sequence identity in
# each sequence, and the total alignment score
