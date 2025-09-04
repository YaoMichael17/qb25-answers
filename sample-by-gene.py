#!/usr/bin/env python3

import sys

dictionary= {}
my_file = open("GTEx_Analysis_2017-06-05_v8_RNASeQCv1.1.9_gene_tpm.gct")

_ = my_file.readline()
_ = my_file.readline()

header=my_file.readline().rstrip().split("\t")
data=my_file.readline().rstrip().split("\t")

# print(header)
# print(data)
for i in range(len(data)):
    dictionary[header[i]] = data[i]

# print(dictionary)
my_file.close()


# if file does not have read/write permission - run "chmod 775 <file>" - this will give all permissions (i.e., read, write, execute)
# gunzip <file> - decrompresses a binary file in place, and removes the ".gz" extension



# counter = 0
# for key,value in dictionary.items():
#     counter += 1
#     if counter < 20:
#         print(key,value)
#     else:
#         break

Second_file= open("GTEx_Analysis_v8_Annotations_SampleAttributesDS.txt")

for ii in (Second_file):
    ii=ii.strip("\n").split("\t")
    SAMPID=ii[0]
    # print(SAMPID)
    if (SAMPID) in dictionary:
        print(f"SAMPID:",{SAMPID})
        print(f"expression:",{dictionary.get(SAMPID)})
        print(f"SMTSD:",{ii[6]})


print("The_first_three_tissues_that_have_>0_expression_:_Minor_Salivary_Gland_,_Brain-Cortex_and_Adrenal_Gland")
  

    


  

Second_file.close()


