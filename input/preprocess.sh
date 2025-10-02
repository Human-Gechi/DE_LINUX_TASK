#!/bin/bash
INPUTFILE=~/data_pipeline/input/sales_data.csv
OUTPUTFILE=~/data_pipeline/output/cleaned_sales_data.csv
LOGFILE=~/data_pipeline/logs/preprocess.log

#Data preprocessing
cut -d, -f1-6 "$INPUTFILE" |grep -v "Failed" >> "$OUTPUTFILE"

#If statement for logs
if [ -s "$OUTPUTFILE" ];then
	echo "Data cleaned and successfully svaed to $INPUTFILE on `date` " >> "$LOGFILE"
else
	echo "ERROR: File does not exist in $OUTPUTFILE" >> "$LOGFILE"
fi
