
clean.data <- function(){
        
        ## download the data and unzip it to data directory
        ##getInitialData()
        
        ## Set the working directory for this task
        dir.path <- "./data/UCI HAR Dataset"
        
        ## Prepare training data
        train.data <- getTrainData(dir.path)
        
        ## Prepare test data
        test.data <- getTestData(dir.path)
        
        ## Merge the training and test data
        message("Merging the training and test data")
        final.merged.data <- rbind(train.data,test.data)
        
        ## Prepare features data
        message("Capturing the relevant features data")
        features.data <- read.table(paste(dir.path,"/features.txt",sep = ""))
        relevant.features <- getFeaturesData(dir.path,features.data)
        
        ## Prepare final Extracted data set from Merged data
        message("Capturing the final data set")
        extracted.data <- final.merged.data[,c(relevant.features,562,563)]
        
        ## Naming the columns of the final data table
        colnames(extracted.data) <-  make.names(c(as.character(features.data[relevant.features,2]),"Subject","Activity"))
        
        ## Calculate average of each activity for each subject for all the feature vectors
        message("Capturing the average data")
        library(plyr)
        average.data <- ddply(extracted.data,.(Subject, Activity),function(x) colMeans(x[,1:66]))
        
        ## Get the final tidy data with descriptive column names
        tidy.data <- getTidyData(dir.path,average.data)
        
        ## Write tidy data to a txt file
        message("Writing the tidy data to a txt file")
        write.table(tidy.data,file=paste(dir.path,"/UCI_HAR_Dataset.txt",sep = ""),row.names=FALSE)
}

getInitialData <- function(){
        ## Download file
        url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(url, destfile = "20Dataset.zip")
        
        ## Create a data directory and unzip data
        if(!file.exists("data")){
                message("Create data directory")
                dir.create("data")
        }
        unzip("20Dataset.zip",exdir="data")
}

getTrainData <- function(dir.path){
        ## Merge Xtrain, Subject, Ytrain
        message("Capturing the training data")
        Xtrain.data <- read.table(paste(dir.path,"/train/X_train.txt",sep = ""))
        Ytrain.data <- read.table(paste(dir.path,"/train/Y_train.txt",sep = ""))
        SubjectTrain.data <- read.table(paste(dir.path,"/train/subject_train.txt",sep = ""))
        merged.train.data <- cbind(Xtrain.data,SubjectTrain.data)
        merged.train.data <- cbind(merged.train.data, Ytrain.data)
        return(merged.train.data)
}

getTestData <- function(dir.path){
        ## Merge Xtest, Subject, Ytest
        message("Capturing the test data")
        Xtest.data <- read.table(paste(dir.path,"/test/X_test.txt",sep = ""))
        Ytest.data <- read.table(paste(dir.path,"/test/Y_test.txt",sep = ""))
        SubjectTest.data <- read.table(paste(dir.path,"/test/subject_test.txt",sep = ""))
        merged.test.data <- cbind(Xtest.data, SubjectTest.data)
        merged.test.data <- cbind(merged.test.data, Ytest.data)
        return(merged.test.data)
}

getFeaturesData <- function(dir.path,features.data){
        ## Extract the relevant features of mean and std from the whole set of features
        message("Extracting features")
        mean.col <- grepl("mean()",features.data[,2], fixed = TRUE)
        std.col <- grepl("std()",features.data[,2], fixed = TRUE)
        relevant.features <- mean.col|std.col
        return(relevant.features)
}

getTidyData <- function(dir.path,average.val){
        ## Capture activity label data and merge it to final data
        message("Capturing the activity labels and merging to average data")
        activity.labels <- read.table(paste(dir.path,"/activity_labels.txt",sep = ""))
        
        ## Merging the final data with the activity labels
        temp.data <- merge(average.val,activity.labels,by.x="Activity",by.y="V1")
        temp.data <- temp.data[order(temp.data$Subject,temp.data$Activity),]
        message("Creating the final tidy data")
        tidy.data <- temp.data[,c(2,69,3:68)]
        colnames(tidy.data)[2] <- "Activity"
        return(tidy.data)
}
