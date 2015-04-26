# courseproject run_analysis
STEP 1: 
The first 7 lines of the code read all the files that are necessary to perform the analysis
line 8 row bind the test data and train data, i.e. the X_test of each. The name of the combined data is "totaldata";
line 9 row bind the test and train activity level, i.e. the y_test of each, the name of the combined data is "activity";
line 10 give column names to the combined data from line 8, the "totaldata". the column names are from the feature.txt;
line 11 give the column name of activity as "activity"; 
line 12 row combines the subjects of test and train, and the combined file is called "subject";
line 13 give column name to "subject" file and the name is also "subject";

STEP 2: 
line 15 to 17 extract the columns that only related to mean and std, it is done by using the grep command, note for the "mean" because some columns have meanFreq, so !grep is used to get rid of those columns that contains meanFreq
line 18 column bind all the "mean" and "std" columns

STEP 3: 
line 20 to 25 replace the activity observations from numbers to more descriptive names ;
line 26 to 27 column bind the activity and subject to the test and train data sets 

STEP 4: 
line 29 to 31 simplifies the columns by using gsub command to get rid of all the underscores and bracket
line 32 to 33 give more discriptive names by replacing f with Freq, Acc with Acceleration
line 34 replace the orginal names with the simplified and descriptive names 

STEP 5: 
line 37 called the reshape2 package. NB: please install.packages("reshape2") if you haven't done it already
line 38 use the melt command to rearranging the data by "subject" and "activity" column
line 39 use the dcast command to perform STEP 5's mean for each subject, activity and variable
line 40 use write.table to generate .txt file for the first box for submission
