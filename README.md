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

The experiment consisted on recording several parameters taken from a signal based on a Samsung Smartphone.  Each of 30 subects carried the device executing several activities as (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).   

The complete description of this original data set can be found at:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

###Transformation Algorithm

A new data set (output.txt) was created based on the following transformations.
1. Only those variables regarding mean and standart deviation information were taking into account

