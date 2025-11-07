library(tidyr)
library(dplyr)
library(palmerpenguins)
library(matrixStats)
library(ggplot2)
library(DESeq2)
library(broom)

#1.1
counts_df <- read_delim("/Users/cmdb/qb25-answers/week8/gtex_whole_blood_counts_downsample.txt")
counts_df[1:5,]

#to move gene IDs to actual row names to make it suitable for DESeq2
#Takes in the previous data frame and the name of the column to change
counts_df <-column_to_rownames(counts_df, var= "GENE_NAME")
counts_df[1:5,]
#GENE_NAME header is gone
#loading the in metadata, to know the different groupings

metadata_df <- read_delim("/Users/cmdb/qb25-answers/week8/gtex_metadata_downsample.txt")
metadata_df[1:5,]
metadata_df <- column_to_rownames(metadata_df, var = "SUBJECT_ID")
metadata_df[1:5,]

mapping_df <- read_delim("/Users/cmdb/qb25-answers/week8/gene_locations.txt") 

#To change the first column name TO SUBJECT_ID for left_join(), helped by google search
names(mapping_df)[1] <-"SUBJECT_ID"
mapping_df[1:5,]


#Check to make sure that the metadata correspond to the count data
table(colnames(counts_df) == rownames(metadata_df))
#TRUE 106

#1.2
#This expression takes the count, metadata, and the design for the response variable.
dds <- DESeqDataSetFromMatrix(countData= counts_df,
                              colData= metadata_df,
                              design = ~SEX +AGE +DTHHRDY)

#1.3
#PCA
#To scale so the highest expression genes don't dominate the results.
#apply VST transformation, trys to model this relationship through mean and controls for the amount of sequences per sample.
vsd <- vst(dds)


plotPCA(vsd)

plotPCA(vsd, intgroup= "SEX")
plotPCA(vsd, intgroup= "AGE")
plotPCA(vsd, intgroup= "DTHHRDY")

#2.1
vsd_df <- assay(dds) %>%
  t() %>%
  as_tibble()

vsd_df <- bind_cols(metadata_df, vsd_df)

t.test(WASH7P~SEX ,data = vsd_df)
#print(vsd_df)
#plotPCA(vsd_df, intgroup= "SEX")
#No, there isn't significant evidence of sex-differential expression as the p-value is higher than 0.05. 

t.test(SLC25A47~SEX ,data = vsd_df)
#Yes, there is a significant evidence of sex-differential expression of this gene. It is shifted more towards the male group. 

#2.2
#Differential expression
ddss <- DESeq(dds)
#2.3
#lfcSE = 
vol <- results(ddss, name  = "SEX_male_vs_female") %>%
  as_tibble(rownames ="SUBJECT_ID") %>%

  filter(padj < 0.1)%>%

  arrange(padj)

print(vol)
#262 genes exhibit significant expression between males and females at a 10% FDR.



merge <- left_join(vol,mapping_df , by = "SUBJECT_ID") %>%
  arrange(padj)
  

print(merge)
#The strongest unregulated genes are RPS4Y1, UTY, KDM5D, DDX3Y, PRKY, EIF1AY, TXLNGY, USP9Y.
#These are more male-upregulated genes as they are part of chromosome Y.

#After comparing the results for gene SLC25A47, it is on chromosome 14, and is high signifcant like before.

#With the change of the FDR threshold from 1% of getting around 100 samples to 20% and getting around 470 samples, this increase the amount of false positives. While the smaller FDR would reduce the amount of false positives.




#2.4
death <- results(ddss, name  = "DTHHRDY_ventilator_case_vs_fast_death_of_natural_causes") %>%
  as_tibble(rownames ="SUBJECT_ID") %>%
  
  filter(padj < 0.1)%>%
  
  arrange(padj)

print(death)

#There is 16,069 genes that are differentially expressed according to death classification at a 10% FDR.


ggplot(data= vol, aes(x= log2FoldChange, y= -log10(padj)))+
  geom_point() 
  )


