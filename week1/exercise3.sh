# grep 1_Active nhek.bed > nhek-active.bed
# grep 12_Repressed nhek.bed > nhek-repressed.bed
# grep 12_Repressed nhlf.bed > nhlf-repressed.bed
# grep 1_Active nhlf.bed > nhlf-active.bed
# wc nhek-active.bed 
#    14013  112104  899705 nhek-active.bed
# wc nhek-repressed.bed 
#    32314  258512 1916982 nhek-repressed.bed
# wc nhlf-active.bed 
#    14888  119104  956585 nhlf-active.bed
# bedtools intersect -a nhek-active.bed -b nhlf-active.bed > both-active
# wc both-active 
#    12174   97392  781739 both-active
# bedtools intersect -v -a nhek-active.bed -b nhlf-active.bed > active-in-nhek
# wc active-in-nhek 
#     2405   19240  154383 active-in-nhek


# We could include -u in the bash code of bedtools intersect -a nhek-active.bed -b nhlf-active.bed > both-active

# bedtools intersect -a nhek-active.bed -b nhlf-active.bed -f 1
# bedtools intersect -a nhek-active.bed -b nhlf-active.bed -F 1
# bedtools intersect -a nhek-active.bed -b nhlf-active.bed -f 1 -F 1

# bedtools intersect -a nhek-active.bed -b nhlf-active.bed > active_in_both
# wc active_in_both 
#    12174   97392  781739 active_in_both
# bedtools intersect -a nhek-active.bed -b nhlf-repressed.bed > active_nhek_repressed_nhlf
# wc active_nhek_repressed_nhlf 
#      359    2872   23029 active_nhek_repressed_nhlf
# bedtools intersect -a nhek-repressed.bed -b nhlf-repressed.bed > repressed_in_both
# wc repressed_in_both 
#    19579  156632 1160547 repressed_in_both

# head -n 1 active_in_both 
# chr1	19923013	19924213	1_Active_Promoter	0	.	19922613	19924613
# head -n 1 active_nhek_repressed_nhlf 
# chr1	1981140	1981540	1_Active_Promoter	0	.	1981140	1981540
# head -n 1 repressed_in_both 
# chr1	11537413	11538213	12_Repressed	0	.	11534013	11538613

Describe the chromatin state across all nine conditions.
NHLF chromatin state is mostly weakly transcribed , short weak promoter, short weak enhancer, short insulator, and a longer active promoter.
NHEK chromatin state differs, starting with transcriptional elongation, mostly weakly transcribed regions, and lacking an insulator.
K562 chromatin state is mostly weakly transcribed and in transcriptional transition, with both a weak and an active promoter.
HUVEC chromatin state is mostly weakly transcribed, featuring a weak enhancer, a weak promoter, and an active promoter.
HSMM chromatin state is mostly weakly transcribed, with transcriptional elongation, a weak promoter, a weak enhancer, and an active promoter.
HMEC chromatin state is mostly weakly transcribed, with a weak promoter and an active promoter.
HepG2 chromatin state includes two sections of weakly transcribed regions, three weak enhancers, one strong enhancer, one weak promoter, and one active promoter.
H1-hESC chromatin state is mostly weakly transcribed, with a weak enhancer, a weak promoter, and an active promoter.
GM12878 chromatin state starts with a strong enhancer, followed by a weak enhancer, a weakly transcribed region, four more weak enhancers, a weak promoter, and an active promoter.


