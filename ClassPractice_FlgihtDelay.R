DelayedFlights <- read.csv ("FlightDelays.csv", header = TRUE)
View(DelayedFlights)
head(DelayedFlights,15)
table(DelayedFlights$Weather)
table(DelayedFlights$Flight.Status)
table(DelayedFlights$DAY_WEEK)/2203*100
DelayedFlights$Day_Week <- as.factor(DelayedFlights$DAY_WEEK) ##coverting cat data
str(DelayedFlights$Day_Week)
table(DelayedFlights$DEST, DelayedFlights$ORIGIN)
table(DelayedFlights$CARRIER)
DelayedFlights$CRS_DEP_TIME<- cut(DelayedFlights$CRS_DEP_TIME, 8)

set.seed(123)
train.index <- sample(c(1:dim(DelayedFlights)[1]), dim(DelayedFlights)[1]*0.6)
valid.index <- setdiff(c(1:dim(DelayedFlights)[1]), train.index)
train.df <- DelayedFlights[train.index,]
valid.df <- DelayedFlights[valid.index,]
library(rpart)
delays.ct <- rpart(Flight.Status~., data = train.df[, -c(3,6,7,12)],
                   method = 'class', maxdepth = 8, cp = 0.001)
summary(delays.ct)

#observe highest rel error, it should correspond to  
library(rpart.plot)
prp(delays.ct)
