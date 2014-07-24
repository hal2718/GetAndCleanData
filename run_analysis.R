


# download and upzip the archive directory
# IMPORTANT!  change this variable to point to the working directory
UURL<-"Downloads/UCI HAR Dataset"
setwd(UURL)

# READ FEATURES AND EXTRACT THOSE WITH MEAN OR STD
# T.df column 1 is variable numbers that will be used to subset the appropriate rows.
# get rid of parenthesis in all entries

  T.activity<-read.table("activity_labels.txt",,header=FALSE)
  T.df<-read.table("./features.txt",sep="",as.is=TRUE)
  T.ch<-T.df[grep("mean|std",T.df[,2]),2]
  T.in<-T.df[grep("mean|std",T.df[,2]),1]
  T.ch<-gsub('\\(\\)',"",T.ch)     
  
# READ train AND test DATASET, COMBINE and EXTRACT ONLY mean AND std COLUMNS
#....test dataset  
  setwd("test")
  testDS<-read.csv("X_test.txt",sep="",header=FALSE)
  ttestDS<-testDS[,T.in]
  colnames(ttestDS)<-T.ch
  testActivity<-read.csv("y_test.txt",header=FALSE)
  testSubject<-read.csv("subject_test.txt",header=FALSE)
  ttestDS["subject"]<-testSubject
  ttestDS["activity"]<-testActivity
 
  #....training dataset
  setwd("../train")
  trainDS<-read.csv("X_train.txt",sep="",header=FALSE)
  ttrainDS<-trainDS[,T.in]
  colnames(ttrainDS)<-T.ch
  trainActivity<-read.csv("y_train.txt",header=FALSE)
  trainSubject<-read.csv("subject_train.txt",header=FALSE)
  ttrainDS["subject"]<-trainSubject
  ttrainDS["activity"]<-trainActivity
  
  # COMBINE train DF AND test DF. Sort by subject and activity then Replace Activity Number with Activity Names.
  q.df<-rbind(ttestDS,ttrainDS)
  combinedDS<-q.df[order(q.df$subject,q.df$activity),]
  combinedDS$activity<-T.activity[combinedDS$activity,2]

 # write out the file as a clean data file in the current directory
   write.csv(combinedDS,file="cleandata1.txt",row.names=FALSE)

# Second Clean Data Set
# calculate the mean for all variables grouped by factors "subject" and "activity"
# use plyr package, from plyr package use ddply to split up data by subject and activity,  ddply invokes apply to calculate mean over the grouped.
# ddply is used this way: ddply(data.df, .(split-by-factor1, and-then-split-by-factor2), this-function-is-applied-to-each-split-data-group)

  library("plyr")
  b.df<-ddply(combinedDS,.(subject,activity),function(combinedDS)apply(combinedDS[,1:78],2,mean))
  write.csv(b.df,file="cleandata2.txt",row.names=FALSE)

print("done")

