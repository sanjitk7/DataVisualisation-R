library(wordcloud2)
library(readr)
library(dplyr)
library(e1071)
library(mlbench)

library(tm)
library(SnowballC)
library("wordcloud")
library("wordcloud2")
library("RColorBrewer")


#reading data
d1 <- read_csv("/Users/sanjitkumar/Documents/VIT_DOC/vit_semester_6/B2 - Data Visualisation/lab/Lab8/biden_data.csv")
glimpse(d1)  
d1

#checking data values
d1$user[1]

# create corp
corp = Corpus(VectorSource(d1$text))

# check corp entries
corp[[1]][1]

#Cleaning the corp before creation of word coloud

#convert to Lowercase
corp = tm_map(corp, PlainTextDocument)
corp = tm_map(corp, tolower)

#Removing Punctuation
corp = tm_map(corp, removePunctuation)

corp[[1]][1]

#Remove stopwords
corp = tm_map(corp, removeWords, c("cloth", stopwords("english")))

corp[[1]][1]

# Stemming
corp = tm_map(corp, stemDocument)

corp[[1]][1]

# Eliminate white spaces
corp = tm_map(corp, stripWhitespace)

corp[[1]][1]

#Create Document Term Matrix
DTM <- TermDocumentMatrix(corp)
matrix <- as.matrix(DTM)
f <- sort(rowSums(matrix),decreasing=TRUE)
d2 <- data.frame(word = names(f),freq=f)
head(d2, 5)
d3 <- d2[c(1:2)]
d1

#CREATING WORD CLOUD
set.seed(200)

wordcloud(words = d2$word, freq = dat$freq, min.freq = 20,
          max.words=300, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))
wordcloud(words = d2$word, freq = dat$freq, min.freq = 20,
          max.words=600, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(5, "RdBu"))
wordcloud(words = d2$word, freq = dat$freq, min.freq = 20,
          max.words=, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(6, "Accent"))
wordcloud(words = d2$word, freq = dat$freq, min.freq = 20,
          max.words=300, random.order=FALSE, order=FALSE, rot.per=0.35, 
          colors=brewer.pal(6, "RdGy"))

words = d2$word
wordcloud2(d2,size=6, shape = 'star')
wordcloud2(d2,size=6, shape = 'cardioid')
wordcloud2(d2,size=6, shape = 'pentagon')
wordcloud2(d2,size=6, shape = 'diamond')
wordcloud2(d2,size=3, shape = 'triangle',backgroundColor = "grey")
