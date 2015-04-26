subjectx<-read.table("C:/Users/Ying Wang/Documents/R/UCI HAR Dataset/test/subject_test.txt")
test<-read.table("C:/Users/Ying Wang/Documents/R/UCI HAR Dataset/test/X_test.txt")
testlabel<-read.table("C:/Users/Ying Wang/Documents/R/UCI HAR Dataset/test/y_test.txt")
subjecty<-read.table("C:/Users/Ying Wang/Documents/R/UCI HAR Dataset/train/subject_train.txt")
train<-read.table("C:/Users/Ying Wang/Documents/R/UCI HAR Dataset/train/X_train.txt")
trainlabel<-read.table("C:/Users/Ying Wang/Documents/R/UCI HAR Dataset/train/y_train.txt")
feature<-read.table("C:/Users/Ying Wang/Documents/R/UCI HAR Dataset/features.txt")
totaldata<-rbind(test,train)
activity<-rbind(testlabel,trainlabel)
names(totaldata)<-feature[,2]
names(activity)<-"activity"

subject<-rbind(subjectx,subjecty)
names(subject)<-"subject"
totalmeanraw<-totaldata[,grep("mean",names(totaldata))]
totalstd<-totaldata[,grep("std",names(totaldata))]
totalmean<-totalmeanraw[,!grepl("Freq",names(totalmeanraw))]
finaltotaldata<-cbind(totalstd,totalmean)
simplenames<-names(finaltotaldata)
sim<-gsub("-","",simplenames)
finalname<-gsub("\\(|\\)","",sim)
names(finaltotaldata)<-finalname

activity[activity==1]<-"walking"
activity[activity==2]<-"walkingupstairs"
activity[activity==3]<-"walkingdownstairs"
activity[activity==4]<-"sitting"
activity[activity==5]<-"standing"
activity[activity==6]<-"laying"
finaldata<-cbind(activity,finaltotaldata)
final<-cbind(subject,finaldata)

changes<-names(final)
accnames<-gsub("Acc","Acceleration",changes)
fnames<-gsub("f","Freq",accnames)
names(final)<-fnames


library(reshape2)
laststep<-melt(final,id=c("subject","activity"))
laststepmean<-dcast(laststep,subject+activity~variable,mean)
submitdata<-write.table(laststepmean,file="run_analysis.txt",row.name=FALSE)
