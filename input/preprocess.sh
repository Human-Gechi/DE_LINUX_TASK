#!/bin/bash

#Directories for input,output,log
INPUTFILE=~/data_pipeline/input/sales_data.csv
OUTPUTFILE=~/data_pipeline/output/cleaned_sales_data.csv
LOGFILE=~/data_pipeline/logs/preprocess.log

#data preprocessing 
cut -d, -f1-6  "$INPUTFILE" |grep -v "Failed" > "$OUTPUTFILE"

if [ -s "$OUTPUTFILE" ]; then
		echo "Data cleaned and saved successfully to $OUTPUTFILE :`date`" >> "$LOGFILE"
else
	echo "`date`: An error occured. File does not exist in $OUTOUTFILE" >> "$LOGFILE"
fi
