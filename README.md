# Preparing-data-for-analysis-on-Stata
Learn how to plan your work, create value labels , reverse-code variables, &amp; creating scales 
The data we will be using are from the U.S Department of Labor, bureau of Labor Statistics, National Longitudinal Survey of Youth, 1997 (NLSY97)
I selected a set of four items to measure how adolescents feel about their mothers and another set of four parallel items to measure how adolescents feel about their fathers. 
# The data created that we will be working with is attached on the file. The file name is;
relate.dta
I opened a log file (attached) to record all the outputs and I also have my do-file to keep my commands for reproducibility.
The log-file and do-file is attached. 
# Tabulate command to see if we did the right thing.
tabulate momcritr R3483700

# Create the value labels for the new created variables
label define often_r 4 "Never" 3 "Rarely" 2 "Sometimes" 1 "Usually" 0 "Always".a "Noninterview" .b "Valid skip" .c "Invalid skip" .d "Don’t know"
 .e "Refusal"

# Assign the often_r to the new variables 
 label values momcritr momblamer dadcritr dadblamer often_r
 
clonevar id = R0000100
clonevar sex = R3828700
clonevar age = R3828100
clonevar mompraise = R3483600
clonevar momhelp = R3483800

clonevar dadpraise = R3485200
clonevar dadhelp = R3485400
