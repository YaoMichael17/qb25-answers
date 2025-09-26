#!/usr/bin/env python3

import sys

dictionary= {}
mismatch = {}

file=open("/Users/cmdb/qb25-answers/week2/variants/A01_01.sam")

for i in file:
    if "@" in i:
        continue
    clean= i.strip("\n").split("\t")
    # print(clean)

    chr= clean[2]
    # alignment = clean[3]
    
    # dictionary[chr] = alignment
    if chr in dictionary:
        dictionary[chr] += 1
    else:
        dictionary[chr] = 1
        
for chr_c in sorted(dictionary):
    print(chr_c,dictionary[chr_c])




for mis in clean[10:]:
    if mis.startswith("NM:i:"):
        slice = int(mis[5:])
        if slice in mismatch:
            mismatch[slice] += 1
        else:
            mismatch[slice] = 1

        break
        

for ii in sorted(mismatch):
    print(ii,mismatch[ii])
        


   
# for key in dictionary.items():
#     keys= int(key)

#     counter[keys] += 1

#     print(key,counter)



# counter = 0
# for key,value in dictionary.items():
#     counter += 1
#     if counter < 20:
#         print(key,value)
#     else:
#         break


# for i in open():
#     #print(i)
#     # fields = i.strip("\n").split("\t")
#     # Sampid= fields[0]
#     # Smtsd= fields[6]
#     # if Sampid == "SAMPID":
#     #     continue
#     # else:
#     #     dictionary[Sampid] = Smtsd
#         # dictionry = {Sampid:Smtsd}

# print(dictionary)




