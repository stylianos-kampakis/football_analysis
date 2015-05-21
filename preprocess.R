if(preprocess_procedure=="basic"){
  train=train[,-preprocess_args$columns_to_remove]
  train=train[train$FTR!="",]
  #train=train[complete.cases(train),]
  library(plyr)
  #train$FTR=revalue(train$FTR, c("H"="x1", "A"="x2","D"="x0"))
  train$FTR=droplevels(train$FTR)
}