### Reading the csv file into an R dataframe

Universities.df <- read.csv("Universities.csv")
head(Universities.df)
str(Universities.df)

###Removing all categorical variables
###Removing all records with missing values
pca17 <- prcomp(na.omit(Universities.df[,-c(1:3)]))
summary(pca17)
pca17$rot

?rot###Principal component analysis on the normalized data
pcs.cor <- prcomp(na.omit(Universities.df[,-c(1:3)]), scale. = T)
summary(pcs.cor)
pcs.cor$rot

