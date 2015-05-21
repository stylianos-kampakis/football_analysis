library(caret)

fitControl <- trainControl(## 10-fold CV
  method = "cv",number=10,repeats=10
)



modelGrid<-expand.grid(n.trees=c(1,2,3,4,5,6,7,8,9,10,20,30,40,50,100),interaction.depth=c(1,2,3),shrinkage=c(0.0001,0.001,0.01,0.1))


model <- train( FTR~ ., data = train,
                  method =algorithm,
                  trControl = fitControl
                #,verbose=FALSE
                  ## This last option is actually one
                  ## for gbm() that passes through
                  #verbose = FALSE
                  #,tuneGrid=modelGrid
                  #,n.minobsinnode=3
)

model
best <- tolerance(model$results, metric = "Kappa",tol = 2, maximize = TRUE)
model$results[best,]
m=gbm(FTR~.,data=train,cv.folds=10,interaction.depth=1,n.trees=3000)

best.iter <- gbm.perf(m,method="cv")
print(best.iter)
