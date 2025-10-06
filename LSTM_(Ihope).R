setwd("D:/DDP_docs")
library(R.matlab)

library(caret)
library(kernlab)
library(e1071)
library(dplyr)

acc_fin=0
validn=matrix(nrow=10, ncol=6)
p=1
q=1
master_TS=read.csv("master_cons_8.csv")

# #0.6-0.85 6 is partition, prob=0.1-0.95 18, nfolds=6-40: 17 for every 2
for (i in seq(0.6,0.85,by=0.05)){
  p=1
  for (j in seq(0.5,0.95, by=0.05)){
    
    train.index <- createDataPartition(master_TS$var_true, p = i, list = FALSE)
    train1 <- master_TS[train.index,]
    test1  <- master_TS[-train.index,]
    #logistic regression model
    train.control <- trainControl(method = "repeatedcv", 
                                  number = 10, repeats = 3)
    weights1 <- ifelse(train1$var_true == 0, 1, train1$Grade)
    train1=select(train1,-Grade)
    test1=select(test1,-Grade)
    model_log <- train(var_true~.,data = train1, method='glm',family = "binomial", weights = weights1, trControl = train.control)
    summary(model_log)
    glm_prob=predict(model_log,newdata = test1,type = "prob")
    glm_pred <- ifelse(glm_prob > j, 1,0)
    # mean(glm_pred == test1$Test)
    
    acc1=mean(glm_pred == test1$var_true)
    # 
    
    if (acc1>acc_fin){
      
      i_fin=i
      j_fin=j
      model1=model_log
      train_fin=train1
      test_fin=test1
      acc_fin=acc1
    }
    
    validn[p,q]=acc1
    p=p+1}
  q=q+1}

glm_prob=predict(model1,newdata = test_fin,type = "response")
glm_pred <- ifelse(glm_prob > j_fin, 1,0)        
mean(glm_pred == test_fin$var_true)
table(glm_pred,test_fin$var_true)
plot(abs(glm_pred-master_TS$var_true),main="Model predictions based on time",xlab="time")


#ROCR Curve
library(ROCR)
ROCRpred <- prediction(glm_prob, test_fin$var_true)
ROCRperf <- performance(ROCRpred, 'tpr','fpr')
plot(ROCRperf, colorize = TRUE, text.adj = c(-0.2,1.7))

cor(master_TS$geo,master_TS$geo_1)
acf(master_TS$msl,lag.max=18,plot=TRUE)
pacf(master_TS$msl,lag.max=18,plot=TRUE)
