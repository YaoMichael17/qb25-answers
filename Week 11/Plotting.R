Coverage <-scan("/Users/cmdb/qb25-answers/week11/coverage_3x.txt")
maxc <- max(Coverage)

xs <- 0:maxc
lambda <-3 
Poisson_Expected <- dpois(xs, lambda) * length(Coverage)
Normal_Expected <- dnorm(xs, mean= lambda, sd= sqrt(lambda)) * length(Coverage)

hist(Coverage, breaks = 0:maxc, main= "3X Coverage", xlab = "Coverage", ylab = "Count")



lines(xs, Poisson_Expected, col="black", lwd=2)
lines(xs, Normal_Expected, col="pink", lwd=2)



Coverage_10 <-scan("/Users/cmdb/qb25-answers/week11/coverage_10x.txt")
maxc10 <- max(Coverage_10)

xs10 <- 0:maxc10
lambda <-10
Poisson_Expected <- dpois(xs10, lambda) * length(Coverage_10)
Normal_Expected <- dnorm(xs10, mean= lambda, sd= sqrt(lambda)) * length(Coverage_10)

hist(Coverage_10, breaks = 0:maxc10, main= "10X Coverage", xlab = "Coverage", ylab = "Count")

lines(xs10, Poisson_Expected, col="black", lwd=2)
lines(xs10, Normal_Expected, col="pink", lwd=2)




Coverage_30 <-scan("/Users/cmdb/qb25-answers/week11/coverage_30x.txt")
maxc30 <- max(Coverage_30)

xs30 <- 0:maxc30
lambda <-30
Poisson_Expected <- dpois(xs30, lambda) * length(Coverage_30)
Normal_Expected <- dnorm(xs30, mean= lambda, sd= sqrt(lambda)) * length(Coverage_30)

hist(Coverage_30, breaks = 0:maxc30, main= "30X Coverage", xlab = "Coverage", ylab = "Count")



lines(xs30, Poisson_Expected, col="black", lwd=2)
lines(xs30, Normal_Expected, col="pink", lwd=2)
