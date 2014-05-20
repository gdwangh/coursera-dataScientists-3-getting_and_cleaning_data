require(reshape2)
require(data.table)

#setwd("D:/document/study/数据分析师系列课程/Getting and cleaning Data/courseProject/UCI HAR Dataset")

# X_train: V1~V561, 561 feature?
feature_name<-read.table("./features.txt",col.names=c("id","name"))
colNames<-gsub("[(),_-]",".",feature_name[,2])

feature_train<-read.table("./train/X_train.txt",col.names=colNames)
feature_test<-read.table("./test/X_test.txt", col.names=colNames)

# Extracts only the measurements on the mean and standard deviation for each measurement. 
col<-mapply(grepl, "[.]mean[.]|[.]std[.]", colNames,  ignore.case=TRUE)

#merge feature and Extracts col
feature<-data.table(rbind(feature_train[,col], feature_test[,col]))

# y_train: active label of train data set 
active_train<-read.table("./train/y_train.txt", col.names=c("active.label"))
active_test<-read.table("./test/y_test.txt", col.names=c("active.label"))

#merge acive lable
active_lable<-rbind(active_train,active_test)

# merge feature, active
feature[, activity.label:=active_lable]

# subject_train: subject identifies(志愿者) of train data set
subject_train<-read.table("train/subject_train.txt", col.names=c("subject.identifies"))
subject_test<-read.table("test/subject_test.txt", col.names=c("subject.identifies"))

#merge subject
subject<-rbind(subject_train, subject_test)

# merge feature, subject
feature[, subject.identifies:=subject]

active_label2name<-data.table(read.table("./activity_labels.txt", col.names=c("activity.label","activity.name")))

# join active_lable and acitve_name
setkey(feature,activity.label)
setkey(active_label2name,activity.label)
resFeature<-merge(feature,active_label2name) # join feature and active_label2name with key activity.label

# lower the names
setnames(resFeature,names(resFeature), gsub("[.]+", ".", gsub("([A-Z])", ".\\L\\1", names(resFeature), perl=TRUE))) # insert . before upper when change upper to lower

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
DT<-melt(resFeature, var.ids=c(1,78), measure.vars=c(2:67), variable.name="V.type", value.name="value") # calls melt.data.table
mean_DT<-dcast(DT, activity.name+subject.identifies~V.type,fun.aggregate=mean, na.rm=TRUE)

# write result to file
write.table(mean_DT,file="../tidy_data.txt",row.names=FALSE,col.names=TRUE,sep='\t',quote=FALSE)
write.table(resFeature,file="../res_feature.txt",row.names=FALSE,col.names=TRUE,sep='\t',quote=FALSE)


# write variable name for code book
write.table(names(mean_DT),"../tmp/mean_DT.txt",sep="\t",row.names=FALSE,col.name=FALSE,quote=FALSE)
write.table(feature_name[col,2],"../tmp/feature_name.txt",sep="\t",row.names=FALSE,col.name=FALSE,quote=FALSE)