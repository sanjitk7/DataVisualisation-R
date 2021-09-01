# sample data frame operations
df1 = data.frame(id = c(1,2,3,4),
                 name = c("sanjit","kumar","veena","muthu"),
                 dob = as.Date(c("2000-05-07","1973-04-07","1975-12-28","1943-01-01"))
                 )
car_df = mtcars
df2 = car_df[1:2,1:2]
car_df[c(1,3)]
df3 = subset(car_df, mpg>25)
str(df2)
subset(car_df, disp==160.0)
c = 0
repeat{
  print("hi",c)
  c=c+1
  if (c>3){
    break
  }
}
f <- function(cc){
  ccc = cc+1
  print(ccc)
}
f(3)

d = read.csv("/Users/sanjitkumar/Documents/VIT_DOC/vit_semester_6/B2 - Data Visualisation/lab/submission2/EconomistData.csv")
d

rbind(df1, car_df)
mtcars
plot(mtcars)
plot(mtcars$mpg)
plot(mtcars$mpg,mtcars$cyl)

par(mfrow=c(2,2), mar=c(2,5,2,1), las=1, bty="o")
plot(mtcars$mpg,mtcars$cyl)

airquality
counts <- table(airquality$Ozone, airquality$Temp)
counts
barplot(counts, main="Air Quality Distribution by Ozone and Temp",
        xlab="Ozone Levels", col=c("darkblue","pink"),
        legend = rownames(counts))

s = mtcars %>% group_by(gear)
s

mtcars
mtcars %>% filter(gear>=4) %>% group_by(carb)

mtcars %>%
  filter(carb > 1) %>%
  group_by(cyl) %>%
  summarise(Avg_mpg = mean(mpg)) %>%
  arrange(desc(Avg_mpg))

p = plot_ly(data=mtcars,
            x=~wt,
            y=~mpg,
            type = "scatter",
            mode = "markers",
            marker = list(size = 7,
                          color = 'rgba(255, 182, 193, .9)',
                          line = list(color = 'rgba(152, 0, 0, .8)',
                                      width = 3))
)
p
