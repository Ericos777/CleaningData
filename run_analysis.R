loadFeatures <- function()
{
  #load all columns
  features <- read.csv(".\\features.txt", sep=" ",header = FALSE) 
  
  #select mean and std columns
  searchPattern <- "mean|std"  
  columns <- grepl(searchPattern,features[,2])
  
  #subselect feature columns
  features <- subset(features,columns)
  
  #return features of mean an std
  features
}

loadActivitys <- function()
  {
  #load file
  activitys <- read.table(".\\activity_labels.txt", sep="",header=FALSE)
  
  #load columnnames
  colnames(activitys) <- c("activity_ID", "Activity_Label")
  
  #return Activitys
  activitys
  
}



loadTest <- function()
{
  #get all mean and std features
  features <- loadFeatures()
  
  #load all files  
  dataX <- read.table(".\\test\\x_test.txt",sep="", header = FALSE)  
  dataY <- read.table(".\\test\\y_test.txt",header = FALSE)
  dataSub <- read.table(".\\test\\subject_test.txt",header = FALSE)
    
  
  #subselect neaded mean and std columns
  dataX <- dataX[features[,1]]
                 
  #add columnnames
  colnames(dataX) <- features[,2]
  colnames(dataY) <- "activity"
  colnames(dataSub) <- "subject"
  
  #combine sets
  data <- cbind(dataX,dataY,dataSub)
  
  #return dataset
  data
  
}

loadTrain <- function(){
  
  #load features
  features <- loadFeatures()
  
  #load files
  dataX <- read.table(".\\train\\x_train.txt",sep="", header = FALSE)  
  dataY <- read.table(".\\train\\y_train.txt",header = FALSE)
  dataSub <- read.table(".\\train\\subject_train.txt",header = FALSE)
  
  
  #subselect neaded mean and std columns
  dataX <- dataX[features[,1]]
  
  #add columnnames
  colnames(dataX) <- features[,2]
  colnames(dataY) <- "activity"
  colnames(dataSub) <- "subject"
  
  #combine sets
  data <- cbind(dataX,dataY,dataSub)
  
  #return dataset
  data
  
}

loadComplete <- function()
{
  dataComplete <- rbind(loadTest(),loadTrain())
}

mergeActivitys <- function()
{
  datacomplete <-loadComplete()
  activitys <- loadActivitys()
  
  #merge activity's
  merged <- merge(dataComplete,activitys,by.x ="activity",by.y="activity_ID",all=TRUE)
  #return merged
  merged
}


loadTidyAggregation <- function()
{
  #load merged dataset
  merged <- mergeActivitys()  
  
  #aggregate by subject and Activity
  #and calculate the average with the function mean on the data column 1 to 79
  aggregation <- aggregate(merged[,1:79] , by = list(subject = merged$subject,activity = merged$Activity_Label),FUN= mean)
  
  #rename duplicate activity column
  colnames(aggregation)[3] <- "Activity_ID"
    
  #return aggregation
  aggregation
} 


writeTidyAggregation <- function()
{
  #load aggregation
  aggregation <- loadTidyAggregation()
  
  #write file
  write.table(aggregation,'.\\aggregation.txt', row.name=FALSE)
  
}

#function call to create the aggregation.txt file when run_analysis.R is runned
writeTidyAggregation()
