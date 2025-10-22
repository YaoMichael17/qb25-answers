#!/usr/bin/env python3

af_out = open("AF.txt", "w")
dp_out = open("DP.txt", "w")
for line in open("/Users/cmdb/qb25-answers/week3/BYxRM_bam/biallelic.vcf"):
    if line.startswith('#'):
        continue
    fields = line.rstrip('\n').split('\t')
    allele= fields[7].split(';')
   
  
    for line2 in allele:
        if line2.startswith('AF='):
            af= line2.split('=')[1]
            af_out.write(f"{af}\n")
            
            
            reads = fields[8].split(':')
            if 'DP' in reads:
                dp_index = reads.index('DP')
                for samples in fields[9:]:
                    i = samples.split(':')
                    if len(i) > dp_index:
                        dp = i[dp_index]
                        dp_out.write(f"{dp}\n")


    # else:
    #     dictionary[new_allele] = name
    
    # for key,value in dictionary.items():
    #     print(key,value)
        


    # grab what you need from `fields`
