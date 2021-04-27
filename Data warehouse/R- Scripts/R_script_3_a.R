install.packages("RODBC")
require(RODBC)
library(RODBC)


#con <- odbcDriverConnect('driver={SQL Server}; server=VIC-PC;database=master;trusted_connection=true')

install.packages("ggplot2")
install.packages("plotrix")
library(plotrix)
library(ggplot2)
install.packages("magrittr")
install.packages("dplyr")
library(magrittr)
library(dplyr) 


#Category1 <- sqlQuery(con, "
#select ld.property_id as location_id ,ld.room_type as roomType,
#lf.list_id as list_id, price as price,
#lf.property_id as property_id from property_dim ld 
#inner join listing_detail_fact lf on ld.property_id=lf.location_id
#")


df <- read.table("Data/R_Script/script3.csv",header =FALSE,sep = ",")

View(df)

colnames(df)

names(df)[names(df) == "V1"] <- "locationid"
names(df)[names(df) == "V2"] <- "roomtype"
names(df)[names(df) == "V3"] <- "listid"
names(df)[names(df) == "V4"] <- "price"
names(df)[names(df) == "V5"] <- "propertyid"



piePercent<-Category1$roomType
percent<- round(Category1$price/sum(Category1$price)*100)
pieChart<-paste(piePercent, percent,"%")
pieChart

aggPie<-aggregate(Category1[,4], list(Category1$roomType), mean)
aggPie1<-data.frame(aggPie$x,aggPie$Group.1)
aggPie1
cat<-data.frame(Category1$price,Category1$roomType)
cat
col=rainbow(length(cat$price)), 

percent<- round(aggPie$x/sum(aggPie$x)*100)
percent
labelPie<- paste(aggPie$Group.1, percent,"%")
labelPie


pie3D(aggPie$x,labels= labelPie,main = "Revenue by offering")




