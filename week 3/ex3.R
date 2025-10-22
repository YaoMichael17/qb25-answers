library(tidyverse)

gt <- read.table("/Users/cmdb/qb25-answers/week3/gt_long.txt", header = TRUE)

colnames(gt) <- c("Sample", "Chrom", "pos_GT")
head(gt)

gt <- gt %>% 
  separate(pos_GT, into = c("pos", "GT")) %>%
  mutate(
  pos = as.numeric(pos),
  GT = as.factor(GT))
  
gtt <- gt %>%
  filter(Sample == "A01_62", Chrom == "chrII")  
  

ggplot(data = gtt, aes(x= pos, y =Sample, color =GT))+
  geom_point() +
  facet_grid(Chrom ~., scales = "free_x") +
  labs(
    x= "Position",
    y= "Genotype"
  )
  



# Question 3.2
#I can see that the chromosome has different sections of colors called haplotype and the occurance of recombination.