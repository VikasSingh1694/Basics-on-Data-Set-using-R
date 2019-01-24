###########################################
###           DATA MANIPULATION         ###
###########################################  

###   CONTENT  ###

##  Loading data
##  Changing column names
##  Changing Data types
##  Verifying  
##  Filtering
##  Sorting
##  Adding variables
##  Rearranging variables
##  Adding observations
##  Combining tables 
##  Aggregating tables
##  Transform


# LOADING FILE
dataset <- read.csv(file.choose(), header = T)
head(dataset)
summary(dataset)

### Summary of "dataset.csv"
# branch:   branch code
# ncust:    number of customers
# age:      age of the borrower
# ed:       educational qualification based on degrees
# employ:   number of years in the job
# address:  number of years in the current address
# income:   income in '000$
# debtinc:  debt to income ratio (or burden) in %
# creddebt: credit card debt in '000$
# othdebt:  other debt in $mn
# default:  dummy for default incidents

# Call a particular cell in a dataframe
dataset[2,1]
dataset[1,2]

class(dataset$age)
search()
attach(dataset)
search()

class(age)

# CHANGING COLUMN NAMES
colnames(dataset)
colnames(dataset)[c(3,5)] <- c("customer.id","edu")
colnames(dataset)

# CHANGING DATA TYPE OF VARIABLES FOR MANIPULATION
levels(dataset[,1])
class(dataset[,1])
dataset[,1] <- as.factor(dataset[,1])
levels(dataset[,1])

summary(dataset)

# FILTERING
dataset.25 <- dataset[dataset$branch=="25", ]
dim(dataset.25)
head(dataset.25)

dataset.25.medianage <- dataset.25[dataset.25$age <= median(dataset.25$age, na.rm=T),]
dim(dataset.25.medianage)

# SORTING
dataset.25.sorted <- dataset.25[order(dataset.25$income),]
head(dataset.25.sorted)

dataset.25.decr <- dataset.25[order(dataset.25$income,decreasing=T),]
head(dataset.25.decr)

# ADDING VARIABLES
head(dataset)
dataset$totaldebt <- dataset$creddebt+dataset$othdebt
head(dataset)

# REARRANGING VARIABLES
#Way1
dataset1 <- dataset[,c("branch","ncust","customer.id", "age",
               "edu", "employ", "address", "income", 
               "debtinc", "creddebt", "othdebt", 
               "totaldebt", "default" )]
head(dataset1)

#Way2
colnames <- colnames(dataset)[1:11]
colnames
dataset2 <- dataset[,c(colnames, "totaldebt", "default" )]
head(dataset2)

# ADDING OBSERVATIONS
dataset.25[100,]
last.row <- c("25",4719, 298345, 52, 5, 4, 20,100, 
              7.9, 1.50,2.15,0)
dataset.25[101,] <- last.row
tail(dataset.25)

# COMBINING TABLES
dataset.49 <- dataset[dataset$branch=="49",]
dim(dataset.49)
dim(dataset.25)
dataset.49[,13] <- NULL

dataset.25.49 <- rbind(dataset.25,dataset.49)
some(dataset.25.49)
dim(dataset.25.49)

dataset.25.49 <- rbind(dataset.25[1:50, ],dataset.49)
some(dataset.25.49)
dim(dataset.25.49)

# CLEAR WORKSPACE
rm(list=ls())


# Creating two tables
dataset <- read.csv(file.choose(), header = T)
dim(dataset)

totaldebt <- dataset$creddebt+dataset$othdebt
dataset1 <- cbind(dataset[1:10,3:4],totaldebt[1:10])
head(dataset1)
dim(dataset1)

# AGGREGATING DATA  ##splits data into subsets &
##and computes statistics for each
aggregate(dataset[,c(8,10,11)], by=list(dataset$branch),
          FUN=sd)

# TRANSFORMING DATA
dataset1 <- transform(dataset, branch=as.factor(branch), 
                  totaldebt = (creddebt+othdebt))
head(dataset1)
class(dataset1$branch)

detach(dataset)
rm(list=ls())