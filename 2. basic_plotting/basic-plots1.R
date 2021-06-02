#dataframes in R tool
data()

airquality

str(airquality)

summary(airquality)

plot(airquality)

plot(airquality$Day,airquality$Temp)

#Grid chart the margin of the grid(mar),
#no of rows and columns(mfrow),
#whether a border is to be included(bty) and position of the
#labels(las: 1 for horizontal, las: 0 for vertical).
par(mfrow=c(2,2), mar=c(2,5,2,1), las=1, bty="n")

# Simple Histogram
#A histogram is very common plot.
#It plots the frequencies that data appears
#within certain ranges.
hist(airquality$Temp, main="Histogram",xlab='temperature',col="orange",ylim=c(0,30))


#Simple Scatterplot
#A scatter plot provides a graphical view of
#the relationship between two sets of numbers.
plot(airquality$Ozone, airquality$Solar.R, main="Scatterplot Airquality",
     xlab="Ozone Level ", ylab="Solar.R level", pch=1,
     col=c("green", "yellow"))


# Simple Bar Plot
#Barplots are useful for comparing the distribution of
#a quantitative variable (numeric) between groups or categories.
W

# Stacked Bar Plot with Colors and Legend
counts <- table(airquality$Ozone, airquality$Temp)
barplot(counts, main="Air Quality Distribution by Ozone and Temp",
        xlab="Ozone Levels", col=c("darkblue","pink"),
        legend = rownames(counts))


# Grouped Bar Plot
counts <- table(airquality$Ozone, airquality$Wind)
barplot(counts, main="Air Pollution Distribution via Ozone and Wind",
        xlab="Ozone", col=c("darkblue","red"),
        legend = rownames(counts), beside=TRUE)

# Simple Pie Chart
slices <- c(100,106, 120,40, 16, 80)
lbls <- c("India","China", "UK", "United States", "Germany", "Other")
pie(slices, labels = lbls, main="Pie Chart of Countries Contribution to Pollution")

# Boxplot of MPG by Car Cylinders
#A boxplot provides a graphical view of the median, quartiles,
#maximum, and minimum of a data set.
boxplot(Ozone~Temp,data=airquality, main="Ozone vs Temp",
        xlab="Ozone", ylab="Temperature")


