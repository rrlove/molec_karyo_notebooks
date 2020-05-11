##TOTAL BARCODED READS
##navigate to the directory holding the files with the **raw** reads
cat *.fastq | wc -l
##this gives you the number of lines; divide by 4 to get reads
##NB, this includes reads for amplicon sequencing in gambiae as well as a similar project in funestus

##PER SPECIMEN
##navigate to the directory holding the per-specimen files, after assignment to barcodes, generated as per pipeline of Campbell et al. 2015
##generate the counts of reads per file, and save
for file in $(ls *.fastq); do lines=$(cat ${file} | wc -l); reads=`expr ${lines} / 4`; echo -e ${file} "\t" ${lines} "\t" ${reads}; done > file_read_range.txt

##PER PLATE
##in same directory as above, using the per-specimen files
##generate the counts of reads per plate, and save
for plate in $(ls *.fastq | cut -d'_' -f 5 | sort | uniq); do total_lines=$(cat *${plate}_*.fastq | wc -l); reads=`expr ${total_lines} / 4`; echo -e ${plate} "\t" ${total_lines} "\t" ${reads}; done > plate_read_range.txt
