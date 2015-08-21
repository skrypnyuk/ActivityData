run_analysis <- function() {

library(plyr)
library(reshape)

subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE, colClasses=c("integer"), col.names = c("subject"))
X_test<-read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_test<-read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE, colClasses=c("integer"), col.names = c("activity"))

subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE, colClasses=c("integer"), col.names = c("subject"))
X_train<-read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
y_train<-read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE, colClasses=c("integer"), col.names = c("activity"))

testdata<-cbind(subject_test,y_test, X_test)
traindata<-cbind(subject_train,y_train, X_train)
mydata<-rbind(testdata,traindata)

features<-read.table("UCI HAR Dataset/features.txt", header = FALSE, col.names = c("number","feature"), colClasses=c("integer","character"))
v<-grepl("mean\\(\\)|std\\(\\)",features$feature)
mydata<-mydata[,which(c(TRUE,TRUE,v))]

activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE, col.names = c("id","name"))
mydata<-ddply(mydata,.(activity),transform,activity=activity_labels$name[activity])

colnames(mydata) <- c("subject","activity",features$feature[v])

newdata <- melt(mydata, id=(c("subject", "activity")))
newdata<-ddply(newdata,.(subject,activity,variable),transform,mean=mean(value))
newdata<-newdata[,c("subject","activity","variable","mean")]
newdata<-unique(newdata)
colnames(newdata) <- c("subject","activity","measurement","mean")

write.table(newdata,file="tidydata.txt",row.name=FALSE)
}



