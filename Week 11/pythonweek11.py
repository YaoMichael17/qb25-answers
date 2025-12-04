#!/usr/bin/env python3

import numpy as np

genomesize= 1000000
readlength= 100
coverage = 3
num_reads = (coverage*genomesize)// readlength

## use an array to keep track of the coverage at each position in the genome
genome_coverage = np.zeros(genomesize, dtype=int)

for i in range(num_reads):
  startpos = np.random.randint(0,genomesize-readlength+ 1)
  endpos = startpos + readlength
  genome_coverage[startpos:endpos] += 1

#saving the file as a .txt file
np.savetxt("coverage_3x.txt", genome_coverage)
# ## get the range of coverages observed
# maxcoverage = max(genomecoverage)​
# xs = list(range(0, maxcoverage+1))

# ## Get the poisson pmf at each of these
# poisson_estimates = get_poisson_estimates(xs, lambda = coverage)

# ## Get normal pdf at each of these (i.e. the density between each adjacent pair of points)
# normal_estimates = get_normal_estimates(xs, mean = genome_coverage, stddev = sqrt(genome_coverage))
# ​
# ## now plot the histogram and probability distributions
# ...


genomesize= 1000000
readlength= 100
coverage = 10
num_reads = (coverage*genomesize)// readlength

## use an array to keep track of the coverage at each position in the genome
genome_coverage = np.zeros(genomesize, dtype=int)

for i in range(num_reads):
  startpos = np.random.randint(0,genomesize-readlength+ 1)
  endpos = startpos + readlength
  genome_coverage[startpos:endpos] += 1

#saving the file as a .txt file
np.savetxt("coverage_10x.txt", genome_coverage)


genomesize= 1000000
readlength= 100
coverage = 30
num_reads = (coverage*genomesize)// readlength

## use an array to keep track of the coverage at each position in the genome
genome_coverage = np.zeros(genomesize, dtype=int)

for i in range(num_reads):
  startpos = np.random.randint(0,genomesize-readlength+ 1)
  endpos = startpos + readlength
  genome_coverage[startpos:endpos] += 1

#saving the file as a .txt file
np.savetxt("coverage_30x.txt", genome_coverage)