spack load py-htseq@0.11.2%gcc@8.4.1
for bam in ../analyses/2_star/geosmithia_morbida_mapping/*.out.bam
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
 ../raw_data/Geosmithia_morbida_genome_annotations.gff\
 >../analyses/3_htseq_count/$name.htseq.counts.txt
done
