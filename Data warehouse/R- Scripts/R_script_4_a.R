install.packages("ggplot2")
install.packages("plotrix")
install.packages("RODBC")
install.packages("plotly")
require(RODBC)
library(RODBC)
library(plotrix)
library(ggplot2)
library(plotly)
#con <- odbcDriverConnect('driver={SQL Server}; 
#server=VIC-PC;database=master;trusted_connection=true')


#Category1 <- sqlQuery(con, "select neighbourhood,count(*) as counter,sum(noOfReviews) as totalReviews, 
#avg(review_scores_rating) as avgRating
#from (select nd.neighbourhood as neighbourhood,rsf.number_of_reviews as noOfReviews,
#CONVERT(float, rsf.review_scores_rating) as review_Scores_rating
#from neighbourhood_dim nd left outer join listing_detail_fact ldf 
#on nd.neighbourhood_id = ldf.id
#left outer join review_scores_fact rsf on rsf.review_score_id=ldf.review_score_id
#) as tbl where neighbourhood != '' group by neighbourhood  order by avgRating")

df <- read.table("D:/GDrive/MSBI_PROJ_20191128_1/R_Script/script4.csv",header =FALSE,sep = ",")

View(df)


temp <- rnorm(100, mean=30, sd=5)
plot_ly(x=Category2$neighbourhood, y=Category2$avgRating,
 z=Category2$totalReviews, 
type="scatter3d", mode="markers")

