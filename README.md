#README run_analysis.R

This README file explains what the 'run_analysis.R' file contains and how the functions work.
There is no codebook needed to explain the variables and parameters because all the functions are variables.
To get a better grasp how functions work exactly 
and how i have done things, it is usefull to look at the run_analysis.R file because it is well documentented due comment lines.

The run_analysis.R file contains the following functions:
 1. loadFeatures()
 2. loadActivitys()
 3. loadTest()
 4. loadTrain()
 5. loadComplete()
 6. mergeActivitys()
 7. loadTidyAggregation()
 8. writeTidyAggregation()
 
the following chaptes will explain the functions
 
###loadFeatures()
this function loads the feature.txt file and returns a dataframe with 
only the features wich names contain either 'mean' or 'std'.
The dataframe consist out of the column_id and featurename 
in total it will return 79 rows 

###loadActivitys()
This function loads the activity_labels.txt file and returns a dataframe with
	1. Activity_ID
	2. Activity_Label

###loadTest()
This function loads the following files in the 'test' folder

	1. x_test.txt
	2. y.test.txt
	3. subject_test.txt

The 'x_test' file dataframe will be stripped of all unnessary columns with help of
the loadFeatures() function wich returns only the columns needed.

Then columnames are added and all files are joined to one dataframe wich is returned


###loadTrain()
This function loads the following files in the 'train' folder
	1. x_train.txt
	2. y.train.txt
	3. subject_train.txt

The 'x_train' file dataframe will be stripped of all unnessary columns with help of
the loadFeatures() function wich returns only the columns needed.

Then columnames are added and all files are joined to one dataframe wich is returned

###loadComplete()
This function combines the two dataframes from the 'loadTest' and 'loadTrain' function
and returns the results of those two functions as one dataframe

###mergeActivitys()
This function merges the dataframe from the 'LoadActivitys' function with 
the dataframe from the 'loadComplete()' function

###loadTidyAggregation()
This function aggregates the dataframe from the mergeActivity's function 
by subject and activity and uses the mean function to calculate the averages of all the mean an std columns
When the aggregation is done the function will return the aggregation dataframe

###writeTidyAggregation()
This function writes the dataframe from the loadTidyAggregation() to the 
aggregation.txt file in the working directory






 
