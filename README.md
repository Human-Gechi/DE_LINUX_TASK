# **Bash Scripting task**
## 📌 **Project Overview**
***
This repo conatins bash scripts for a data processing pipeline involving data manipulation,automation, scheduling using cron and logging errors or successes
***
### **Project Structure**
data_pipeline/#Parent directory
|--input #directory for handling inputs/untransfromed files
  |--sales_data.csv #Input dataset
  |--preprocess.sh #Bash script for data processing
|--output #directory for output
  |--cleaned_sales_data.csv #Cleaned datset 
|--logs #directory for logs
  |--monitor.sh #Bash script for monitoring 
  |--preprocess.log #Log file for success or error in processing input file
  |--monitoring.log #Log file for keeping monitoring logs
  ***
1. #### **Setting up the environment**
  Initiating a connection to the server,generating SSH keys for connecting to github, remotely add url and creating            directories for the task using
  ```bash
   mkdir data_pipeline

   cd data_pipeline
   mkdir input output logs
 ```
2. #### **Data Ingestion and preprocessing**
  **Data Ingestion**: This was done using curl to dowmload sales_data.csv from datatengineering-commuinity repo
  ```bash
   curl -L -o sales_data.csv https://raw.githubusercontent.com/dataenginneering-community/launchpad/main/Linux.sales_data.csv
   ```
  **Data preprocessing :** [View Here](input/preprocess.sh)
    The script preprocess.sh made executable using chmod +x [preprocess.sh](input/preprocess.sh)
***
3. #### **Automation with Cron Jobs**
   Data pipeline was scheduled to run daily at 12AM.
   My script runs 12:00AM WAT(Nigerian Time)

  *Opening crontab editor*
  ```bash
  crontab -e #For adding or editing cron jobs
  #scheduling pipeline to run 12AM WAT ; WAT is 1 hour ahead of CEST time
  0 1 * * /home/okoliogechi74/data_pipeline/input/preprocess.sh>>/home/okoliogechi74/data_pipeline/output/preprocess.log 2>&1
  ```
4. #### **Logs and monitoring**
   Monitorin script : [monitor.sh](logs/monitor.sh)
   The script scans for ERROR/case insentive

   **Scheduling cron job for moitoring data to run 12:00 AM Nigerian time**
    5 1 * * * /home/okoliogechi74/data_pipeline/monitor.sh >>/home/okoliogechi74/data_pipeline/logs/monitor.log 2>&1
5. #### **File or directory premissions**
   **INPUT FOLDER**
   The [sales_data.csv](input/sales_data.csv) has file permission 644
   The [preprocess.sh](input/preprocess.sh) has file permission 700

   **OUTPUT FOLDER**
   The [cleaned_sales_data.csv](output/cleaned_sales_data.csv) has file permission 644 : user/owner can read/write;others       can only read

   **LOGS FOLDER**
   The [preprocess.log](logs/preprocess.log) and [monitoring.log](logs/monitoring.log) has file permissions 600: user can       read and write while group and others cannot.

   The [monitor.sh](logs/monitor.sh) has file permissions 700; only the user can read,write and execute. Everyother person      can't.
