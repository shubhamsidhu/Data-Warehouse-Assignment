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


#Category_1 <- sqlQuery(con, "select sum(price) as price,country from (
#select location_id,country,list_id , pd.price as price from (
#select ld.location_id as location_id ,ld.country as country,lf.list_id as list_id ,lf.property_id as property_id from lcoation_dim ld 
#inner join listing_detail_fact lf on ld.location_id=lf.location_id)  as tbl1
#inner join property_dim pd on tbl1.property_id=pd.property_id ) as tbl2 group by country order by 1 desc
#")

df <- read.table("Data/script1.csv",header =FALSE,sep = ",")

View(df)

#plot(df$country,df$price,xlab="Country",ylab="frequency")

colnames(df)

names(df)[names(df) == "V1"] <- "locationid"
names(df)[names(df) == "V2"] <- "country"
names(df)[names(df) == "V3"] <- "listid"
names(df)[names(df) == "V4"] <- "price"


df.sum <-group_by(df,country) 
df.sum
sumCntry<-summarise(df.sum,revenue_per_country = sum(price,na.rm=TRUE))
sumCntry

pct <- round(sumCntry$revenue_per_country/sum(sumCntry$revenue_per_country)*100)
pct

cat_2 <- paste(sumCntry$country, pct,"%")
cat_2



pie3D(sumCntry$revenue_per_country,labels = cat_2, col=rainbow(length(cat_2)),
      explode=0.1,radius=.8, main = "Revenue by Country", col.main = "red",
      labelcex = 1.2,  start=0.7)


barplot(height=sumCntry$revenue_per_country, names=sumCntry$country , 
col.main = "red",col=rainbow(length(sumCntry$country)),
xlab="Country",ylab="Revenue",main="Revenue by country")


