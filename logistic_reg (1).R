library(R.matlab)
var_geo<-readMat("geo_avg_20.mat")
var_msl<-readMat("msl_avg_20.mat")

var_true=var_month$Cyc_Occ
var_true <- as.matrix(var_true)

var_geo<-as.data.frame(var_geo)
var_msl<-as.data.frame(var_msl)

#var_rel<-as.data.frame(var_rel)

master_mat<-cbind(var_geo,var_msl)

#outlier removal
hist(var_geo$geo.cons.7)

#data splitting

library(caret)
library(kernlab)
library(e1071)
acc_fin=0
validn=matrix(nrow=10, ncol=6)
p=1
q=1
master_cons<-as.data.frame(cbind(master_mat,var_true))
# #0.6-0.85 6 is partition, prob=0.1-0.95 18, nfolds=6-40: 17 for every 2
 for (i in seq(0.6,0.85,by=0.05)){
   p=1
   for (j in seq(0.5,0.95, by=0.05)){
      
        train.index <- createDataPartition(master_cons$var_true, p = i, list = FALSE)
        train1 <- master_cons[train.index,]
        test1  <- master_cons[-train.index,]
        #logistic regression model
        weights1 <- ifelse(train1$var_true == 0, 1, table(train1$var_true)[1]/table(train1$var_true)[1])
        model_log <- glm(var_true~.,data = train1, family = "binomial", weights = weights1)
        summary(model_log)
        glm_prob=predict(model_log,newdata = test1,type = "response")
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
plot(abs(glm_pred-master_cons$var_true),main="Model predictions based on time",xlab="time")

  #ROCR Curve
  library(ROCR)
ROCRpred <- prediction(glm_prob, test_fin$var_true)
ROCRperf <- performance(ROCRpred, 'tpr','fpr')
plot(ROCRperf, colorize = TRUE, text.adj = c(-0.2,1.7))
