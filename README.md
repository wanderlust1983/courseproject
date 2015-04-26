# courseproject run_analysis
The first 7 lines of the code read all the files that are necessary to perform the analysis
line 8 row bind the test data and train data, i.e. the X_test of each. The name of the combined data is "totaldata"
line 9 row bind the test and train activity level, i.e. the y_test of each, the name of the combined data is "activity"
line 10 give column names to the combined data from line 8, the "totaldata". the column names are from the feature.txt
line 11 give the column name of activity as "activity"
line 12 to 17 replace the activity observations from numbers to more descriptive names 
line 18 row combines the subjects of test and train, and the combined file is called "subject"
line 19 give column name to "subject" file and the name is also "subject"
line 20 to 22 extract the columns that only related to mean and std, i.e. STEP 4, it is done by using the grep command, note for the "mean" because some columns have meanFreq, so !grep is used to get rid of those columns that contains meanFreq
line 23 column bind all the "mean" and "std" columns
line 24 to 27 simplifies the columns by using gsub command to get rid of all the underscores and bracket. the simplified dataset is called "finaltotaldata"
line 28 column bind the file activity to the dataset, and is named "finaldata"
line 29 column bind the subject to the "finaldata", and is called "final"
STEP 5: line 30 called the reshape2 package. NB: please install.packages("reshape2") if you haven't done it already
line 31 use the melt command to rearranging the data by "subject" and "activity" column
line 32 use the dcast command to perform STEP 5's mean for each subject, activity and variable
line 33 use write.table to generate .txt file for the first box for submission
