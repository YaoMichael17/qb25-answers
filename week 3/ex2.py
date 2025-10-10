#!/usr/bin/env python3


for line in open("/Users/cmdb/Downloads/biallelic.vcf"):
    if line.startswith('#'):
        continue
    fields = line.rstrip('\n').split('\t')
    allele= fields[7].split(';')
   
  
    for line2 in allele:
        if line2.startswith('AF'):
            print(line2[3:])


    # else:
    #     dictionary[new_allele] = name
    
    # for key,value in dictionary.items():
    #     print(key,value)
        


    # grab what you need from `fields`
