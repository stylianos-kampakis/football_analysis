main_dir="C:/Users/stelios/Dropbox/Freelance/Football/"


#train_model parameters
#algorithms=c("gbm","glm","rf","xgboost")
algorithm="gbm"
number_of_folds=10
grid=c()
metric="ROC"


#Load_data expects that all files are in the folder specified by main_dir/data/.
#Load_data should not perform any unecessary manipulations, such as removing columns, which should be performed
#by preprocess.
source(file.path(main_dir,"load_data.R"))



#The preprocess_procedure determines which kind of preprocessing is conducted. The id="none" always corresponds to 
#returning the dataset itself. Other options can include, for example, pca or clustering through k-meanspreprocess_procedure="none"

preprocess_procedure="basic"
preprocess_args=list(columns_to_remove=c(1,2,3,4,5,6,8,9,10))
source(file.path(main_dir,"preprocess.R"))

#feature_selection parameters

#common choices here can be chi-square, or info_gain, for example
#feature selection is always conducted first using the train set and then the results are then carried over
#to the test set. So, for example, if you use chi-square attribute evaluation, the evaluation will be conducted
#on the training set and any features that are removed will be removed from both datasets.
feature_selection_procedure="removal"
#the feature selection arguments is a list of the form argument=value. All the arguments for all
#the procedures should be in that list. The arguments to be used are decided by the feature selection procedure
feature_selection_args=list(argument1=c())
source(file.path(main_dir,"feature_selection.R"))





#source(file.path(main_dir,"statistical_fitting.R"))
source(file.path(main_dir,"train_model.R"))
#source(file.path(main_dir,"predict_submit.R"))
