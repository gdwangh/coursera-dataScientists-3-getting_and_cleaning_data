##merge the data set and extract the the measurements on the mean and standard deviation 
* read table from file "feature.txt" to be used as the column names

  In features.txt, the second column is the descriptor of the feature which is corresponding to the columns in the train and test dataset, I think. So it's good to use them as the columns of the data table read from ./train/X_train.txt and "./test/X_test.txt" in the next step.
  
* clean the feature descriptor for variables name

For the descriptor in the second columns have some charactors, such as "(" ,")", which is invalid or not good as column names, so the scipt replace "()-_" with "." to get the feature descriptor for data variable name.
  
* read the data set

read.table() read the data from "X_train.txt" & "X_test.txt", using parameter "col.names" to figure feature descriptor as the names of the variables, and store the data set into memory

*create the logic vetor on variables names of measurements on the men and standard deviation

Only the measurements on the mean and standard deviation for each measurement is quired, as feature_info.txt, whose feature descriptor include mean() and std(), and variables name include ".mean." or ".std.". So, the logic vector was created, in which the variables name with mean and standard deviation are true otherwise are false/NA

*exact the subsetting columns and merge data set

With the logic vector, get the subsetting columns of the train data set and test data set, and merge them as the whole dataset

##Uses descriptive activity names to name the activities in the data set
*read the acitvity labels dataset from y_train.txt & y_test.txt
*merge train & test activity labels and then add them to the feature data set
*read the subjectss dataset from subject_train.txt & subject_test.txt
*merge train & test subjectss and then add them to the feature data set
*read the relation between activivites lables and names from activity_labels.txt
because there is no key to combine the feature data set and activivites lables together, we can't merge the label and name first, otherwise the record order will be changed and doesn't correspond to feature any more.
	
*set activity.label as key, and join the activity name and the feature record with acitvities label

##Appropriately labels the data set with descriptive activity names. 
*when ready to feature name, "-" & "_" has been change to "."
*change the uppercase letter to lower letter and add "." in front of it. e.g. BodyBody-->.body.body
*get rid of the Continuous superfluous "." ,e.g. "..mean.." --> ".mean."

##Creates a second, independent tidy data set with the average of each variable for each activity and each subject
*melt() group the dataset by col 1(activity label) and 79(variable) with measure col 2~78
*dcast() use mean() to caculate the average of each group which identified by activity.name+subject.identifies

# write the result 
  write the result into file tidy_data.txt