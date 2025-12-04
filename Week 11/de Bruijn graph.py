#!/usr/bin/env python3


reads = ['ATTCA', 'ATTGA', 'CATTG', 'CTTAT', 'GATTG', 'TATTT', 'TCATT', 'TCTTA', 'TGATT', 'TTATT', 'TTCAT', 'TTCTT', 'TTGAT']


   
graph = set()
#assume all reads are from the forward strand, no sequencing errors, complete coverage of the genome
k=3

for read in reads:
  for i in range(len(read) - k):
     kmer1 = read[i: i+k]
     kmer2 = read[i+1: i+1+k]
     #add "kmer1, kmer2" to graph
     graph.add((kmer1, kmer2))
# for read in graph:
#    print (graph)


#sort the output into a text file called edges.txt
#for a directed graph (digraph G)
with open("edges.dot", "w") as f:
    f.write("digraph G {\n")
    for a, b in graph:
        f.write(f'"{a}" -> "{b}";\n')
    f.write("}\n")

#-Tpng is to use to have the output as a PNG
#edges.dot to make the de Brujin graph
#having the output name as ex2_digraph.png
#dot -Tpng edges.dot -o ex2_digraph.png