# 18BCE0715 - Sanjit Kumar
books = read.csv("/Users/sanjitkumar/Documents/VIT_DOC/vit_semester_6/B2 - Data Visualisation/lab/submission3/books.csv.xls")
books
install.packages(dplyr)
library(dplyr)
install.packages("magrittr")
library(magrittr) # needs to be run every time you start R and want to use %>%
library("ggplot2")
# omit NA
books2 = na.omit(books)
books2

# Visualize frequency distribution of checkouts in the book dataset
str(books2)
ggplot(books2, aes(tot_chkout)) +
  geom_bar(fill = "#0073C2FF")


# Visualize boxplot plot high usage books by call number class[Hint:
# derive new variable high usage books which have more than 10 checkouts] 
# and color by subCollection- any three category
high_usage_books = books2[books2$tot_chkout>10,]
high_usage_books
df_remove_one_cat = high_usage_books[high_usage_books$subCollection != "reserves",]

ggplot(df_remove_one_cat, aes(x=callnumber,y=tot_chkout, fill=subCollection)) + 
  geom_boxplot(outlier.colour="orange", outlier.shape=16,
               outlier.size=2, notch=FALSE)

# Visualize stacked bar and group chart high usage books by call number 
# class[Hint: derive new variable high usage books which have more than 
# 10 checkouts] and color by subCollection- any four category

ggplot(high_usage_books, aes(x=callnumber,y=tot_chkout, fill=subCollection)) + 
  geom_bar(position="stack",stat="identity")
ggplot(high_usage_books, aes(x=callnumber, y=tot_chkout, fill=subCollection)) + geom_bar(position="dodge", stat="identity")

#Create a bar plot that depicts the number of items in each 
# sub-collection, faceted by format. Arrange sub plots horizontally.


freq_table <- books2 %>%
  group_by(subCollection, format) %>%
  summarise(count = n())

str(freq_table)
ggplot(freq_table, aes(x=subCollection, y=count, fill=format)) + geom_bar(position="stack", stat="identity")
ggplot(freq_table, aes(x=subCollection, y=count, fill=format)) + geom_bar(position="dodge", stat="identity")


# New Themes


ggplot(books2, aes(tot_chkout)) +
  geom_bar(fill = "#0073C2FF") +
  theme(legend.position="none",
        axis.title.x = element_text(color="#f7860c", size=14, face="bold"),
        axis.title.y = element_text(color="#73ceff", size=14, face="bold"))



ggplot(df_remove_one_cat, aes(x=callnumber,y=tot_chkout, fill=subCollection)) + 
  geom_boxplot(outlier.colour="orange", outlier.shape=16,
               outlier.size=2, notch=FALSE) + theme_bw()

ggplot(high_usage_books, aes(x=callnumber, y=tot_chkout, fill=subCollection)) + geom_bar(position="dodge", stat="identity") + theme_dark()

ggplot(freq_table, aes(x=subCollection, y=count, fill=format)) + geom_bar(position="dodge", stat="identity") + theme_linedraw() + theme(legend.position="none",
                                                                                                                                        axis.title.x = element_text(color="yellow", size=14, face="bold"),
                                                                                                                                        axis.title.y = element_text(color="green", size=14, face="bold"))
p <- ggplot(books2,aes(subCollection)) +
  geom_bar() +
  facet_wrap(~format)
  p
