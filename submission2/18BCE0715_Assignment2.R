# 18BCE0715 - Sanjit Kumar
eco = read.csv("/Users/sanjitkumar/Documents/VIT_DOC/vit_semester_6/B2 - Data Visualisation/lab/submission2/EconomistData.csv")
eco

install.packages("plotly") 
install.packages("dplyr") 
install.packages("magrittr")
library(plotly)
library(magrittr)
library(dplyr) 

eco$Region
#Stacked bar char
plot_ly(eco, x = eco$Region, y=~HDI.Rank,type="bar",name="Rank") %>%
  add_trace(y = ~CPI, name="CPI") %>%
  add_trace(y = ~HDI, name="HDI") %>%
  layout(yaxis=list(title='hdi,cpi, rank wrt region'),barmode='stack')

#Scatter Plot

p = plot_ly(data=eco,
            x=eco$CPI,
            y=eco$HDI,
            type = "scatter",
            color = I("black")
)
p

eco$HDI.Rank
# Mapping Color of Points to Region

p = plot_ly(data=eco,
            x=~CPI,
            y=~HDI,
            type = "scatter",
            hoverinfo = "text",
            text = paste("HDI Rank: ", eco$HDI.Rank)
) %>%
  add_annotations(
    x=eco$CPI[which.min(eco$HDI.Rank)],
    y=eco$HDI[which.min(eco$HDI.Rank)],
    text="Best Rank",
    showarrow=T
)%>%
  add_annotations(
    x=eco$CPI[which.max(eco$HDI.Rank)],
    y=eco$HDI[which.max(eco$HDI.Rank)],
    text="Worst Rank",
    showarrow=T
  )

p

oc <- eco[which(eco$Country== "India"), ]
p <- plot_ly(data = eco, x = ~CPI, y = ~HDI, type = 'scatter', mode = 'markers',
             color=~Region) %>%
  add_annotations(x = oc$CPI, y = oc$HDI,
                  text = paste(oc$Country,oc$HDI.Rank, sep=" "),
                  xref = "x", yref = "y", showarrow = TRUE, arrowhead = 5, ax = 60, ay = 40)

p

htmlwidgets::saveWidget(p, "/Users/sanjitkumar/Documents/VIT_DOC/vit_semester_6/B2 - Data Visualisation/lab/submission2/plot.html")


