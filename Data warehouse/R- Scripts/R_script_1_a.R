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

#select location_id,city,list_id , pd.price as price from (
#select ld.location_id as location_id ,ld.city as city,lf.list_id as list_id ,lf.property_id as property_id from lcoation_dim ld 
#inner join listing_detail_fact lf on ld.location_id=lf.location_id)  as tbl1
#inner join property_dim pd on tbl1.property_id=pd.property_id 


df <- read.table("D:/GDrive/MSBI_PROJ_20191128_1/R_Script/script2.csv",header =FALSE,sep = ",")

View(df)



colnames(df)

names(df)[names(df) == "V1"] <- "locationid"
names(df)[names(df) == "V2"] <- "city"
names(df)[names(df) == "V3"] <- "listid"
names(df)[names(df) == "V4"] <- "price"




df.sum <-group_by(df,city) 
df.sum
sumCntry<-summarise(df.sum,revenuepercity = sum(price,na.rm=TRUE))
sumCntry
View(sumCntry)
attach(sumCntry)

sumCntry<-head(arrange(sumCntry,desc(revenuepercity)), n = 5)


View(sumCntry)
pct <- round(sumCntry$revenuepercity/sum(sumCntry$revenuepercity)*100)
pct

cat_2 <- paste(sumCntry$city, pct,"%")
cat_2

#plot(df$country,df$price,xlab="Country",ylab="frequency")

pie3D(sumCntry$revenuepercity,labels = cat_2, col=rainbow(length(cat_2)),
      explode=0.1,radius=.8, main = "Revenue by Country", col.main = "red",
      labelcex = 1.2,  start=0.7)







 	

