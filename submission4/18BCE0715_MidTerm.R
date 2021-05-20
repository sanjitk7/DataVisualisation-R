library(dplyr)
require(ggplot2)
str(mpg)
df = mpg

# Cars With Maximum Highway Milage
df[df$hwy == max(df$hwy),]

# Mean City Milage for Compact Cars
df2 = filter(df,df$class=="compact")
mean_city_milage = mean(df2$cty)
mean_city_milage

# Group by Class and Find Mean
mean_classes = group_by(df, class) %>% summarize(m = mean(cty)) %>% arrange(desc(m))
mean_classes

#smallest absolute difference between highway and city milage

df$absdiff = abs(df$hwy - df$cty)
df[df$absdiff == max(df$absdiff),]

#mean highway milage of each year
mean_year_hwy = group_by(df, year) %>% summarize(m = mean(hwy))  %>% arrange(desc(m))
mean_year_hwy

#visualisation of mean milage by class
p<-ggplot(mean_classes, aes(x=class, y=m)) + geom_bar(stat='identity')
p
