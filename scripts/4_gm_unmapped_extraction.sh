spack load samtools@1.10%gcc@8.4.1 arch=linux-rhel8-zen
spack load bedtools2
for file in /pickett_centaur/project/tcd_control_rnaseq/analyses/2_star/geosmithia_morbida_mapping/*.out.bam
do
name=`basename $file|sed s'/.geosmithia.Aligned.sortedByCoord.out.bam//'`
echo $name

samtools view -b -f 4 -F 264 $file > /pickett_centaur/project/tcd_control_rnaseq/analyses/2_star/gm_unmapped_fastq/$name.r1.unmap.bam
samtools view -b -f 8 -F 260 $file > /pickett_centaur/project/tcd_control_rnaseq/analyses/2_star/gm_unmapped_fastq/$name.r2.unmap.bam
samtools view -b -f 12 -F 256 $file > /pickett_centaur/project/tcd_control_rnaseq/analyses/2_star/gm_unmapped_fastq/$name.r1r2.unmap.bam
samtools merge /pickett_centaur/project/tcd_control_rnaseq/analyses/2_star/gm_unmapped_fastq/$name.unmapped.bam /pickett_centaur/project/tcd_control_rnaseq/analyses/2_star/gm_unmapped_fastq/$name.r1.unmap.bam /pickett_centaur/project/tcd_control_rnaseq/analyses/2_star/gm_unmapped_fastq/$name.r2.unmap.bam /pickett_centaur/project/tcd_control_rnaseq/analyses/2_star/gm_unmapped_fastq/$name.r1r2.unmap.bam
samtools sort -n /pickett_centaur/project/tcd_control_rnaseq/analyses/2_star/gm_unmapped_fastq/$name.unmapped.bam -o /pickett_centaur/project/tcd_control_rnaseq/analyses/2_star/gm_unmapped_fastq/$name.unmapped.sorted.bam
bedtools bamtofastq -i /pickett_centaur/project/tcd_control_rnaseq/analyses/2_star/gm_unmapped_fastq/$name.unmapped.sorted.bam -fq /pickett_centaur/project/tcd_control_rnaseq/analyses/2_star/gm_unmapped_fastq/$name.gm.unmapped.1.fastq.gz -fq2 /pickett_centaur/project/tcd_control_rnaseq/analyses/2_star/gm_unmapped_fastq/$name.gm.unmapped.2.fastq
rm //pickett_centaur/project/tcd_control_rnaseq/analyses/2_star/gm_unmapped_fastq/*.bam
gzip /pickett_centaur/project/tcd_control_rnaseq/analyses/2_star/gm_unmapped_fastq/*.fastq

done
