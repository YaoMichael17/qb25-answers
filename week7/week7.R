library(tidyr)
library(dplyr)
library(palmerpenguins)
library(matrixStats)
library(ggplot2)

data <- read.delim("/Users/cmdb/qb25-answers/week7/read_matrix.tsv")
data2 <-as.matrix(data)
#Have to convert to numeric matrix
mode(data2) <- "numeric"

#To find the standard deviation
data_sd <- rowSds(data2)

#To select top 500 most vaiant genes for PCA.
data_set <- order(data_sd, decreasing = TRUE)[1:500]
top500 <- data2[data_set,]

rownames(pca$x)


#invert my matrix
invert <- t(top500)


#normalize data like livecoding
scaled <- scale(invert)

#to run PCA
pca <- prcomp(scaled)

#samples <- as.character(rownames(pca$x))

#Creating tibble
samples_2 <- tibble(
  sample = rownames(pca$x),
  PC1 = pca$x[,1],
  PC2 = pca$x[,2]
  #separate(col =samples, into = c("tissue", "replicate"), sep ="-")

)
#Using tidyr::separate() to splite one column into multiple columns and then using sep to separate  

samples_2 <- samples_2 %>%
  separate(col =sample, into = c("tissue", "replicate"), sep ="_")

samples_2 %>%
  ggplot(aes(PC1, PC2, color = tissue, shape= replicate))+
  geom_point(size = 1)+
  labs(
    x= 'PC1',
    y= 'PC2'
  )

#seq(1, length(pca$sdev), 1) is to create/list a sequence of numbers for the PC
#mutate the var to sd^2 is to square the standard deviation, and sum(va) is to find the total variance .

variance <- tibble(PC= seq(1, length(pca$sdev), 1), sd = pca$sdev) %>%
  mutate(va = sd^2) %>%
  mutate(norm_va= va/sum(va))

ggplot(variance, aes(PC, norm_va))+
  geom_bar(stat= "identity", fill="cyan")+ 
  labs(
    x= "PC" ,
    y= "variance"
  )




combined = data[,seq(1, 21, 3)]
combined = combined + data[,seq(2, 21, 3)]
combined = combined + data[,seq(3, 21, 3)]
combined = combined / 3

standarddev <- rowSds(as.matrix(combined))

#keep only genes with a standard deviation greater than 1.
filter <- combined[standarddev >1,]

#k-means 
#To ensure it is replicable, first set the seed to 42 (set.seed)
set.seed(42)
result <- kmeans(scale(as.matrix(filter)),centers =12, nstart=100)

#To get the cluster labels from the cluster object returned by kmeans, use $cluster.
labels <-result$cluster

#Using the cluster labels, sort the rows of your gene-filtered data matrix and then the cluster labels themselves.
kmeans_1 <- filter[order(labels),]
kmeans_2 <- labels[order(labels)]


#to turn x into numeric matrix
kmeans_1<- as.matrix(kmeans_1)


#to fix invalid value specified for graphical parameter,

heatmap(kmeans_1, Rowv=NA, Colv=NA, RowSideColors=RColorBrewer::brewer.pal(12,"Paired")[kmeans_2], ylab="Gene")



cluster5<- rownames(kmeans_1)[kmeans_2==5]
cluster6<- rownames(kmeans_1)[kmeans_2==6]

head(cluster5)
head(cluster6)

