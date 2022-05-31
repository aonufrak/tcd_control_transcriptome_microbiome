for forward in ../analyses/1_skewer/*-pair1.fastq
do
name=`basename $forward|sed 's/-pair1.fastq//'`
reverse=`basename $forward|sed 's/-pair1.fastq/-pair2.fastq/'`
echo Mapping files $forward and $reverse
/pickett_centaur/software/STAR/STAR\
 --runThreadN 20\
 --genomeDir /pickett_centaur/project/tcd_control_rnaseq/analyses/2_star/genome_directory_juglans_regia\
 --readFilesIn $forward /pickett_centaur/project/tcd_control_rnaseq/analyses/1_skewer/$reverse\
 --outSAMtype BAM SortedByCoordinate\
 --outFileNamePrefix ../analyses/2_star/juglans_regia_mapping/$name.
done
