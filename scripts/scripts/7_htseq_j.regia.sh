spack load py-htseq@0.11.2%gcc@8.4.1
for bam in ../analyses/2_star/juglans_regia_mapping/*.out.bam
do
name=`basename $bam|sed s'/-trimmed.Aligned.sortedByCoord.out.bam//g'`
echo Counting reads $name
htseq-count\
 --format=bam\
 --order=pos\
 --stranded=no\
 --type=gene\
 --idattr=ID\
 $bam\
 ../raw_data/GCF_001411555.2_Walnut_2.0_genomic.gff\
 >../analyses/3_htseq_count/j.regia_counts/$name.j.regia.htseq.counts.txt
done
