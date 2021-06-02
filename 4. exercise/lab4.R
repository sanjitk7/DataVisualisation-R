#stacked-bar
mtcars$gear <- factor(mtcars$gear) # Create a categorical variable
mtcars$cyl <- factor(mtcars$cyl) # Create categorical variable

mtcars

install.packages("plotly")
library(plotly)

install.packages("ggplot2")

# Creates stacked bar chart
fig <- plot_ly(data =mtcars, type = "bar",x=mtcars$gear, y=mtcars$cyl )
fig <- fig %>% add_trace(data = mtcars, x=mtcars$gear, y=mtcars$cyl, type = "bar")
fig <- fig %>% layout(yaxis = list(title = 'Count'), barmode = 'stack')

fig

#mtcars
#mtcars$gear <- as.numeric(mtcars$gear) # Create a num variable
#mtcars$cyl <- as.numeric(mtcars$cyl)
#mtcars$am <- as.numeric(mtcars$am) # Create a num variable
#mtcars$cyl <- factor(mtcars$cyl)
#str(mtcars)

#Grouped Bar Chart
plot_ly(mtcars, x = ~cyl, y=~mpg,type="bar",name="mpg") %>%
  add_trace(y = ~hp, name="Horse Power") %>%
  layout(yaxis=list(title='count'),barmode='group')

#Stack bar chart
plot_ly(mtcars, x = ~cyl, y=~mpg,type="bar",name="mpg") %>%
  add_trace(y = ~hp, name="Horse Power") %>%
  layout(yaxis=list(title='mpg and hp by cylinders'),barmode='stack')

#Stack bar chart
plot_ly(mtcars, x = ~cyl, y=~mpg,type="bar",name="mpg") %>%
  add_trace(y = ~hp, name="Horse Power") %>%
  add_trace(y = ~carb, name="Carb") %>%
  layout(yaxis=list(title='mpg and hp by cylinders'),barmode='stack')

a <- aggregate(mpg ~ cyl+hp, data=mtcars, sum)
a

#Adding Custom labels that will show when you hover your mouse over to bar
a$cyl_label <- ifelse(a$cyl == 4,'4 Cylinder',ifelse(a$cyl==6,'6 Cylinder','8 Cylinder'))
plot_ly(a, x = ~cyl,y = ~mpg,name = "Plotly Bar Chart Example", type = "bar", text = ~cyl_label)

#Customizing bar color and Changing the x labels angle
plot_ly(mtcars, x = ~cyl, y=~mpg,type="bar",color = I("blue") ,name="mpg and hp by cylinders") %>%
  add_trace(y = ~hp, name="Horse Power", color = I("black")) %>%
  layout(xaxis = list(title='Cylinders',tickanle=-45),yaxis=list(title='count'),barmode='group')

#subplots
fig1 <- plot_ly(data = mtcars,
                x=~mpg,
                y=~wt)
fig1 <- fig1 %>% add_lines(name = ~"cyl")
fig2 <- plot_ly(data = mtcars,
                x=~mpg,
                y=~wt)
fig2 <- fig2 %>% add_lines(name = ~"cyl")
fig3<- subplot(fig1, fig2)

fig3

mtcars


#3d

mtcars$am[which(mtcars$am == 0)] <- 'Automatic'
mtcars$am[which(mtcars$am == 1)] <- 'Manual'
mtcars$am <- as.factor(mtcars$am)

fig <- plot_ly(mtcars, x = ~wt, y = ~hp, z = ~qsec, color = ~am,
               colors = c('#BF382A', '#0C4B8E'))
fig <- fig %>% add_markers()
fig <- fig %>% layout(scene = list(xaxis = list(title = 'Weight'),
                                   yaxis = list(title = 'Gross horsepower'),
                                   zaxis = list(title = '1/4 mile time')))

fig