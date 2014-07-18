# Getting & Cleaning Data Course Project

Hi everybody..   This is a repo for the Getting & Cleaning Data Course Project from Coursera.

###Files:

1. run_analysis.R:    R script for getting a tidy data set from the UCI HAR Dataset.
2. output.txt:        Tidy dataset.   I was loaded as .txt becuase Coursera platform doesn't allow .csv.  
                      In order to use it as csv file,  it should be renamed to output.csv.
3. codeBook.txt:      Code book describing all variables, data types and othe information.
4. 

###Source:


The original dataset was taken form the Human ACtivity Recognition Using Smartphones Dataset Version 1.0 developed by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The original dataset is known as the UCI-HAR Dataset.

The experiment consisted on recording several parameters taken from a signal based on a Samsung Smartphone.  Each of 30 subects carried the device executing several activities as (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).   

The complete description of this original data set can be found at:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

###Transformation Algorithm

The UCI-HAR dataset provides two diferent folders:  Test and Train.   Both folders contains the same file structure that consists on an X, Y and Subject information.  

A new data set (output.txt) was created based on the following transformations.

1. STEP 1:  The first step was to setup the correct working directory on R such that the two folders (Test and Train) where located under thisone.  So, ./test/ should allow to acces the Xtest, Ytest and Subjecttest files while the ./train/ path should allow to acces the Xtrain, Ytrain and Sujecttrain files.  the run_analysis.R script must be located under the working directory.
2. STEP 2 consisted on put together the Xtest and Xtrain files.   In order to do this, all rows from Xtest and Xtrain files where put together on the dt data.frame object.  Only those variables about mean or std information were copied there.  Then, all variables were renamed looking for a better description.  So, those variables in the original file that started with "t..." where renamed as "time..", while those stating with "f..." where renamed as "fft..".  The firstones deal with time information while the second ones deal with frecuency information based on a fast fourier transformation. Other renamed transformation were using upperCase for the first letter of the second (or subsequent) words.  All variable names start with lowercase.  The rbind command was used in order to do the horizontal integration of rows.
3. STEP 3 consisted on putting together subjectTest and subjectTrain information, renamed that column to "subjectID" and then vertically integrated with the dt data.frame object. The cbind command was used.
4. STEP 4 consisted on putting together Ytrain and Ytest information, renamed thad column to "activity" and then horizontally integrated with the dt data.frame object.  The cbind command was used.
2. Only those variables regarding mean and standart deviation from the UCI-HAR dataset where copied to the new dataset.
3. The UCI-HAR dataset provides two sources:  test and train folders.  Both folders contained the same amount of files.  The 
