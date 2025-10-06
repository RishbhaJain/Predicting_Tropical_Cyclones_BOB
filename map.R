library(lubridate)
var_cons=read.csv("cons_true.csv",na.strings = c("", "NA"))
library("dplyr") 
var_cons=as.data.frame(var_cons)
var_cons=select(var_cons, Basin.of.origin, Date.DD.MM.YYYY., Latitude..lat.., Longitude..lon.., Grade)
var_cons=filter(var_cons, Basin.of.origin=="BOB" )
var_cons=filter(var_cons,Longitude..lon..!="")
library(ggmap)
plot(var_cons$Longitude..lon.., var_cons$Latitude..lat..)
var_month=read.csv("monthlydates.csv")
library("RColorBrewer")

names(var_cons)[names(var_cons)=="Date.DD.MM.YYYY."]<- "YYMM"
names(var_cons)[names(var_cons)=="Latitude..lat.."]<- "Latitude"
names(var_cons)[names(var_cons)=="Longitude..lon.."]<- "Longitude"
names(var_month)[names(var_month)=="ï..Date"]<- "YYMM"
names(var_month)[names(var_month)=="TRUE."]<- "Cyc_Occ"
var_month$YYMM<- format(as.Date(var_month$YYMM,format="%d-%m-%Y"),"%Y-%m")
var_cons$YYMM<- format(as.Date(var_cons$YYMM, format= "%d-%m-%Y"),"%Y-%m")
var_cons$Latitude=as.numeric(var_cons$Latitude)
var_cons$Longitude=as.numeric(var_cons$Longitude)
var_cons$Grade=as.numeric(var_cons$Grade)

Lat_df=aggregate( Latitude ~ YYMM, var_cons, mean )
Lon_df=aggregate( Longitude ~ YYMM, var_cons, mean )
grade_df=aggregate( Grade ~ YYMM, var_cons, mean )

for(i in 1:456)
{
 var_month$Cyc_Occ[i]=0;
}

for(i in 1:203)
{
  var_month$Cyc_Occ[which(var_month$YYMM==Lon_df$YYMM[i])]=1
}

for(i in 1:456)
{
  if(var_month$Cyc_Occ[i]==1){
    var_month$Latitude[i]=Lat_df$Latitude[which(Lat_df$YYMM==var_month$YYMM[i])]
    var_month$Longitude[i]=Lon_df$Longitude[which(Lon_df$YYMM==var_month$YYMM[i])]
    var_month$Grade[i]=grade_df$Grade[which(grade_df$YYMM==var_month$YYMM[i])]
  }
}
var_month_true=subset(var_month,Cyc_Occ==1)

plot(var_month_true$Longitude, var_month_true$Latitude, main="Spatial Distribution of TCs", ylab="Latitude", xlab="Longitude", pch=15,)
monthly_dist=read.csv("month_dis.csv")
barplot(monthly_dist$Frequency,names.arg=monthly_dist$ï..Month,xlab="Month",ylab="Frequency",col="black",
        main="Monthly frequency distribution of TCs")
hist(var_month_true$Grade,breaks = c(0,1,2,3,4,5, 6),main="Frequency distribution of TC Grades", xlab="Grade",ylab="Frequency", col="black",border="white")
cols = brewer.pal(4, "Blues")
# Define colour pallete
pal = colorRampPalette(c("blue", "red"))
library("lattice")
xyplot(Latitude ~Longitude , data=var_, pch=15,group=Grade,type="p",auto.key=list(space="right"))
library("ggplot2")
#data(var_month_true)
qplot(Longitude, Latitude, data = Grade, colour = color)
var_month$pred=glm_pred
var_month_highG=subset(var_month,Grade>3) 
plot(var_month_highG$Longitude, var_month_highG$Latitude, col = ifelse((var_month_highG$pred==0),'red','green'), pch = 15)





