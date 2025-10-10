library(tidyverse)

allele <- read.table("AF.txt", header = TRUE)

print(head(allele))

allele %>%
  ggplot(aes(x=AF)) +
  geom_histogram(bins = 11, fill = "red", color = "black") +
  labs(
    title = "Allele frequency spectrum",
    x = "Allele frequency ",
    y = "Variants"
  )
#Question 2.1
#The graph shows that most variants have an allele frequency around 0.3–0.5. These are relatively low allele frequencies, which may be due to the limited number of mutations that naturally occur.




dp <- read.table("DP.txt", header = FALSE)
colnames(dp) <- c("DP")

dp$DP <- as.numeric(dp$DP)

dp2 <- dp %>% filter(is.finite(DP))
graph <- dp2 %>%
  ggplot(aes(x = DP)) +
  geom_histogram(bins = 21, fill= "red", color = "black") +
  
  labs(
    title = "Read depth distribution",
    x= "Read Depth",
    y= "Variant"
  ) +
  xlim(0, 20) 

print(graph)

#Question 2.2
#The graph shows the variants in the y-axis and the sequencing of the read depth for all these samples. Where we can see that most have a read depth around 15 and above. 

