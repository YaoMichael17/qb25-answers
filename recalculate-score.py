#!/usr/bin/env python3

import sys

my_file = open(sys.argv[1])

for line in my_file:
    line= line.rstrip("\n").split("\t")
    score= line[4]
    score_int=int(score)
    

    end= line[2]
    start= line[1]
    end_int=int(end)
    start_int=int(start)

    feature= end_int-start_int
    new_score= score_int*feature
    if line[5] == "-":
        new_score *= -1
    else:
        new_score = new_score
    print(f"{line[0]}\t{line[1]}\t{line[2]}\t{line[3]}\t{new_score}\t{line[5]}")
    