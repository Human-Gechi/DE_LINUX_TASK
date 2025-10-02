#!/bin/bash
#directories of preprocesslog and  monitoring logs
LOGS=~/data_pipeline/logs
MONITOR_LOGS="$LOGS/monitoring.log"
file="$LOGS/preprocess.log"

#Check for the prescence of ERROR in the preprocess.log file
ERROR=$(grep -i "ERROR" "$file")
#if statement fi an error exists in the preprocess.log file
if [ -n "$ERROR" ]; then #if Keyword ERROR is found,
	echo "An error exists in $file" #Prints this message in the terminal
	echo "$ERROR" # Ooutputs error in the terminal

	#error message is appended to monitoring.log file

	echo "`date`: Error in $file">>"$MONITOR_LOGS"
	echo "`date`: $ERROR">>"$MONITOR_LOGS"
	echo "" >>"$MONITOR_LOGS"
fi

#if statement for command line
if [ -s "$MONITOR_LOGS" ]; then
	echo "`date`: Errors found. Check $MONITOR_LOGS for more details"
else
	echo  "`date`: No errors found"
	echo  ""
fi
