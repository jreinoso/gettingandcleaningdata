# STEP 1: SETTING THE WORKING DIRECTORY
# The working directory must be located in the inmediate
# parent directory of the test and train folders. 
# Ej:
# The location of the X_test.txt must be:
#     ./test/X_test.txt
# The location of the X_train.txt must be:
#     ./train/X_train.txt

#STEP 2:  Putting X_train and X_test together avoiding unwanted columns. 
#  Read x_test.txt taking away those columns that are not "mean" related.  
#  Read x_train.txt doind the same
#  rbind both files (putting together rows)

dt <- rbind(read.table("./test/X_test.txt", colClasses=c(rep("numeric",3), rep("numeric",3),rep("NULL",34),
                                                         rep("numeric",3), rep("numeric",3),rep("NULL",34),
                                                         rep("numeric",3), rep("numeric",3),rep("NULL",34),
                                                         rep("numeric",3), rep("numeric",3),rep("NULL",34),
                                                         rep("numeric",3), rep("numeric",3),rep("NULL",34),
                                                         rep("numeric",1), rep("numeric",1),rep("NULL",11),
                                                         rep("numeric",1), rep("numeric",1),rep("NULL",11),
                                                         rep("numeric",1), rep("numeric",1),rep("NULL",11),
                                                         rep("numeric",1), rep("numeric",1),rep("NULL",11),
                                                         rep("numeric",1), rep("numeric",1),rep("NULL",11),
                                                         rep("numeric",3), rep("numeric",3),rep("NULL",73),
                                                         rep("numeric",3), rep("numeric",3),rep("NULL",73),
                                                         rep("numeric",3), rep("numeric",3),rep("NULL",73),
                                                         rep("numeric",1), rep("numeric",1),rep("NULL",11),
                                                         rep("numeric",1), rep("numeric",1),rep("NULL",11),
                                                         rep("numeric",1), rep("numeric",1),rep("NULL",11),
                                                         rep("numeric",1), rep("numeric",1),rep("NULL",18)
                                                   )),
            read.table("./train/X_train.txt", colClasses=c(rep("numeric",3), rep("numeric",3),rep("NULL",34),
                                                           rep("numeric",3), rep("numeric",3),rep("NULL",34),
                                                           rep("numeric",3), rep("numeric",3),rep("NULL",34),
                                                           rep("numeric",3), rep("numeric",3),rep("NULL",34),
                                                           rep("numeric",3), rep("numeric",3),rep("NULL",34),
                                                           rep("numeric",1), rep("numeric",1),rep("NULL",11),
                                                           rep("numeric",1), rep("numeric",1),rep("NULL",11),
                                                           rep("numeric",1), rep("numeric",1),rep("NULL",11),
                                                           rep("numeric",1), rep("numeric",1),rep("NULL",11),
                                                           rep("numeric",1), rep("numeric",1),rep("NULL",11),
                                                           rep("numeric",3), rep("numeric",3),rep("NULL",73),
                                                           rep("numeric",3), rep("numeric",3),rep("NULL",73),
                                                           rep("numeric",3), rep("numeric",3),rep("NULL",73),
                                                           rep("numeric",1), rep("numeric",1),rep("NULL",11),
                                                           rep("numeric",1), rep("numeric",1),rep("NULL",11),
                                                           rep("numeric",1), rep("numeric",1),rep("NULL",11),
                                                           rep("numeric",1), rep("numeric",1),rep("NULL",18)
            )))
colnames(dt) <- c("timeBodyAccMeanX","timeBodyAccMeanY","timeBodyAccMeanZ",                           
                  "timeBodyAccStdX","timeBodyAccStdY","timeBodyAccStdZ",    
                  "timeGravityAccMeanX","timeGravityAccMeanY","timeGravityAccMeanZ",
                  "timeGravityAccStdX","timeGravityAccStdY","timeGravityAccStdZ",                 
                  "timeBodyAccJerkMeanX","timeBodyAccJerkMeanY","timeBodyAccJerkMeanZ",
                  "timeBodyAccJerkStdX","timeBodyAccJerkStdY","timeBodyAccJerkStdZ",                  
                  "timeBodyGyroMeanX","timeBodyGyroMeanY","timeBodyGyroMeanZ",
                  "timeBodyGyroStdX","timeBodyGyroStdY","timeBodyGyroStdZ",                                    
                  "timeBodyGyroJerkMeanX","timeBodyGyroJerkMeanY","timeBodyGyroJerkMeanZ",
                  "timeBodyGyroJerkStdX","timeBodyGyroJerkStdY","timeBodyGyroJerkStdZ",                                    
                  "timeBodyAccMagMean",
                  "timeBodyAccMagStd",                  
                  "timeGravityAccMagMean",
                  "timeGravityAccMagStd",
                  "timeBodyAccJerkMagMean",
                  "timeBodyAccJerkMagStd",
                  "timeBodyGyroMagMean",
                  "timeBodyGyroMagStd",
                  "timeBodyGyroJerkMagMean",
                  "timeBodyGyroJerkMagStd",
                  "fftBodyAccMeanX","fftBodyAccMeanY","fftBodyAccMeanZ",
                  "fftBodyAccStdX","fftBodyAccStdY","fftBodyAccStdZ",
                  "fftBodyAccJerkMeanX","fftBodyAccJerkMeanY","fftBodyAccJerkMeanZ",
                  "fftBodyAccJerkStdX","fftBodyAccJerkStdY","fftBodyAccJerkStdZ",
                  "fftBodyGyroMeanX","fftBodyGyroMeanY","fftBodyGyroMeanZ",
                  "fftBodyGyroStdX","fftBodyGyroStdY","fftBodyGyroStdZ",
                  "fftBodyAccMagMean",
                  "fftBodyAccMagStd",
                  "fftBodyBodyAccJerkMagMean",
                  "fftBodyBodyAccJerkMagStd",
                  "fftBodyBodyGyroMagMean",
                  "fftBodyBodyGyroMagStd",
                  "fftBodyBodyGyroJerkMagMean",
                  "fftBodyBodyGyro:56MagStd")

# STEP 3:  Putting togheter the test/subject and train/subject files and then add those columns to dt data.frame.

dt2 <- rbind(read.table("./test/subject_test.txt"),
             read.table("./train/subject_train.txt"))
colnames(dt2) <- c("subjectId")

dt <- cbind(dt,dt2)

# STEP 4:  Putting togheter  test/Y and train/Y files and then add those columns to dt data.frame
dt2 <- rbind(read.table("./test/y_test.txt"),
             read.table("./train/y_train.txt"))
colnames(dt2) <- c("activity")

dt <- cbind(dt,dt2)

# STEP 5:  Changing activity ID for a Descriptive Activity
dt$activity <- as.character(dt$activity)

dt$Activity[dt$activity=="1"] <- "WALKING"
dt$Activity[dt$activity=="2"] <- "WALKING_UPSTAIRS"
dt$Activity[dt$activity=="3"] <- "WALKING_DOWNSTAIRS"
dt$Activity[dt$activity=="4"] <- "SITTING"
dt$Activity[dt$activity=="5"] <- "STANDING"
dt$Activity[dt$activity=="6"] <- "LAYING"

# STEP 6:   Creating second data frame getting mean of all variables grouping by subjectId and Activity 
dt2 <- aggregate(dt[,1:66],list(dt$activity,dt$subjectId), FUN=mean)
colnames(dt2) <- c("activity", "subjectId", 
                   "mean_timeBodyAccMeanX","mean_timeBodyAccMeanY","mean_timeBodyAccMeanZ",                           
                   "mean_timeBodyAccStdX","mean_timeBodyAccStdY","mean_timeBodyAccStdZ",    
                   "mean_timeGravityAccMeanX","mean_timeGravityAccMeanY","mean_timeGravityAccMeanZ",
                   "mean_timeGravityAccStdX","mean_timeGravityAccStdY","mean_timeGravityAccStdZ",                 
                   "mean_timeBodyAccJerkMeanX","mean_timeBodyAccJerkMeanY","mean_timeBodyAccJerkMeanZ",
                   "mean_timeBodyAccJerkStdX","mean_timeBodyAccJerkStdY","mean_timeBodyAccJerkStdZ",                  
                   "mean_timeBodyGyroMeanX","mean_timeBodyGyroMeanY","mean_timeBodyGyroMeanZ",
                   "mean_timeBodyGyroStdX","mean_timeBodyGyroStdY","mean_timeBodyGyroStdZ",                                    
                   "mean_timeBodyGyroJerkMeanX","mean_timeBodyGyroJerkMeanY","mean_timeBodyGyroJerkMeanZ",
                   "mean_timeBodyGyroJerkStdX","mean_timeBodyGyroJerkStdY","mean_timeBodyGyroJerkStdZ",                                    
                   "mean_timeBodyAccMagMean",
                   "mean_timeBodyAccMagStd",                  
                   "mean_timeGravityAccMagMean",
                   "mean_timeGravityAccMagStd",
                   "mean_timeBodyAccJerkMagMean",
                   "mean_timeBodyAccJerkMagStd",
                   "mean_timeBodyGyroMagMean",
                   "mean_timeBodyGyroMagStd",
                   "mean_timeBodyGyroJerkMagMean",
                   "mean_timeBodyGyroJerkMagStd",
                   "mean_fftBodyAccMeanX","mean_fftBodyAccMeanY","mean_fftBodyAccMeanZ",
                   "mean_fftBodyAccStdX","mean_fftBodyAccStdY","mean_fftBodyAccStdZ",
                   "mean_fftBodyAccJerkMeanX","mean_fftBodyAccJerkMeanY","mean_fftBodyAccJerkMeanZ",
                   "mean_fftBodyAccJerkStdX","mean_fftBodyAccJerkStdY","mean_fftBodyAccJerkStdZ",
                   "mean_fftBodyGyroMeanX","mean_fftBodyGyroMeanY","mean_fftBodyGyroMeanZ",
                   "mean_fftBodyGyroStdX","mean_fftBodyGyroStdY","mean_fftBodyGyroStdZ",
                   "mean_fftBodyAccMagMean",
                   "mean_fftBodyAccMagStd",
                   "mean_fftBodyBodyAccJerkMagMean",
                   "mean_fftBodyBodyAccJerkMagStd",
                   "mean_fftBodyBodyGyroMagMean",
                   "mean_fftBodyBodyGyroMagStd",
                   "mean_fftBodyBodyGyroJerkMagMean",
                   "mean_fftBodyBodyGyroMagStd")

