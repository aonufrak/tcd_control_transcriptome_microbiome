for forward in ../raw_data/*1.fq.gz
do
name=`basename $forward|sed 's/.fq.gz//'`
reverse=`basename $forward|sed 's/_1.fq.gz/_2.fq.gz/'`
echo Trimming files $forward and ../raw_data/$reverse
/pickett_centaur/software/skewer/skewer\
 $forward\
 ../raw_data/$reverse\
 -m pe\
 -t 2\
 -x AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT\
 -y GATCGGAAGAGCACACGTCTGAACTCCAGTCACGGATGACTATCTCGTATGCCGTCTTCTGCTTG\
 -o ../analyses/1_skewer/$name
done

