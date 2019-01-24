#*** Data Frames
stats <- read.csv(file.choose())
head(stats)
head(stats,30)
class(stats)
#---- Exploring Data -------------------------
stats
nrow(stats)
ncol(stats)
head(stats,n=10)
tail(stats)
str(stats) 
summary(stats)
head(stats)
stats[3,3]
stats[3,"Birth.rate"]
head(stats,10)
stats[1,3]
stats[3,1]
stats[3,]
stats$Internet.users # returns a vectorstats[,3]
stats[,"Internet.users"]
#***
stats$Income.Group
#aCol <- levels(stats$"Income.Group")
#aCol
#--- Basic Opers with a DF
stats[1:10,] #subsettomg
stats[1]

is.data.frame(stats[1])# Check the  datadrame or not
stats[1,]is.data.frame(stats[1,]) # no need for drop=F like in matrix
stats[1]
is.data.frame(stats[1])
stats[,1]
is.data.frame(stats[,1]) # this is not a DF
#this is all rows and first col
#is.data.frame(stats[1,]) # no need for drop=F like in matrix
#this is first row and all cols
is.data.frame(stats[,1,drop=F]) # this is a DF
# multiply cols
#*** 1
head(stats,n=10)
stats$Birth.rate * stats$Internet.users
head(stats$Birth.rate * stats$Internet.users)
stats$Birth.rate + stats$Internet.usershead(stats)
stats$MyCalc <- stats$Birth.rate * stats$Internet.users
head(stats)
stats$MyCalc2 <- stats$MyCalc
head(stats)
stats$MyCalc <- NULL
head(stats)
stats$MyCalc2 <- NULL
head(stats)
sum(stats$Birth.rate)
stats[4,1]
#stats <- read.csv("DemographicData.csv")#stats[4,1]
head(stats)
View(stats)
# everthing is a vectorized oper
1:5
head(stats,n=12)
stats$xyz <- 1:5
head(stats,n=12)
stats$xyz <- NULL
head(stats,n=12)
nrow(stats)
head(stats,n=12)#--- Filtering a DF
stats$Internet.users < 2
filter <- stats$Internet.users<2
stats[filter,] # countries with lt 2% int users
stats[stats$Birth.rate>40,]
stats[stats$Birth.rate>40 & stats$Internet.users < 2,]
stats[stats$Income.Group == "High income",]
stats[stats$Country.Name == "Malta",]
#*** 2
### qplot
?qplot
#install.packages("ggplot2")
library(ggplot2)
qplot(data=stats,x=Internet.users)
qplot(data=stats,x=Income.Group,y=Birth.rate,size=I(3))
qplot(data=stats,x=Internet.users,y=Birth.rate,
      size=I(3))
qplot(data=stats,x=Income.Group,y=Birth.rate,
      size=I(3),
      colour=I("blue"))
qplot(data=stats,x=Income.Group,y=Birth.rate,size=3)
qplot(data=stats,x=Income.Group,y=Birth.rate,size=30)
qplot(data=stats,x=Income.Group,y=Birth.rate,
      size=I(6))
qplot(data=stats,x=Income.Group,y=Birth.rate,
      size=I(3),
      colour=I("blue"))

qplot(data=stats,x=Income.Group,y=Birth.rate,size=I(3),
      colour=I("pink"))
qplot(data=stats,x=Income.Group,y=Birth.rate,
      size=I(3),
      colour=I("green"))


qplot(data=stats,x=Income.Group,y=Birth.rate,
      size=I(3),
      colour="green")
qplot(data=stats,x=Income.Group,y=Birth.rate,
      geom="boxplot")
#--- Visualization
qplot(data=stats,x=Internet.users,y=Birth.rate)
#scatterplot
qplot(data=stats,x=Internet.users,y=Birth.rate,
      size=I(4))
?qplot
qplot(data=stats,x=Internet.users,y=Birth.rate,
      colour=I("red"),size=I(4))head(stats)
qplot(data=stats,x=Internet.users,y=Birth.rate,
      colour=Income.Group,size=I(4))#*** 3
# Create DFs
Countries_2012_Dataset <- c("Aruba","Afghanistan","Angola","Albania","United Arab
                            Emirates","Argentina","Armenia","Antigua and
                            Barbuda","Australia","Austria","Azerbaijan","Burundi","Belgium","Benin","Burkina
                            Faso","Bangladesh","Bulgaria","Bahrain","Bahamas, The","Bosnia and
                            Herzegovina","Belarus","Belize","Bermuda","Bolivia","Brazil","Barbados","Brunei
                            Darussalam","Bhutan","Botswana","Central African
                            Republic","Canada","Switzerland","Chile","China","Cote d'Ivoire","Cameroon","Congo,
                            Rep.","Colombia","Comoros","Cabo Verde","Costa Rica","Cuba","Cayman Islands","Cyprus","Czech
                            Republic","Germany","Djibouti","Denmark","Dominican Republic","Algeria","Ecuador","Egypt, ArabRep.","Eritrea","Spain","Estonia","Ethiopia","Finland","Fiji","France","Micronesia, Fed.
                            Sts.","Gabon","United Kingdom","Georgia","Ghana","Guinea","Gambia, The","GuineaBissau","Equatorial Guinea","Greece","Grenada","Greenland","Guatemala","Guam","Guyana","Hong
                            Kong SAR, China","Honduras","Croatia","Haiti","Hungary","Indonesia","India","Ireland","Iran, Islamic
                            Rep.","Iraq","Iceland","Israel","Italy","Jamaica","Jordan","Japan","Kazakhstan","Kenya","Kyrgyz
                            Republic","Cambodia","Kiribati","Korea, Rep.","Kuwait","Lao PDR","Lebanon","Liberia","Libya","St.
                            Lucia","Liechtenstein","Sri Lanka","Lesotho","Lithuania","Luxembourg","Latvia","Macao SAR,
                            China","Morocco","Moldova","Madagascar","Maldives","Mexico","Macedonia,
                            FYR","Mali","Malta","Myanmar","Montenegro","Mongolia","Mozambique","Mauritania","Mauritius","
                            Malawi","Malaysia","Namibia","New
                            Caledonia","Niger","Nigeria","Nicaragua","Netherlands","Norway","Nepal","New
                            Zealand","Oman","Pakistan","Panama","Peru","Philippines","Papua New Guinea","Poland","Puerto
                            Rico","Portugal","Paraguay","French Polynesia","Qatar","Romania","Russian
                            Federation","Rwanda","Saudi Arabia","Sudan","Senegal","Singapore","Solomon Islands","Sierra
                            Leone","El Salvador","Somalia","Serbia","South Sudan","Sao Tome and Principe","Suriname","Slovak
                            Republic","Slovenia","Sweden","Swaziland","Seychelles","Syrian Arab
                            Republic","Chad","Togo","Thailand","Tajikistan","Turkmenistan","Timor-Leste","Tonga","Trinidad and
                            Tobago","Tunisia","Turkey","Tanzania","Uganda","Ukraine","Uruguay","United States","Uzbekistan","St.
                            Vincent and the Grenadines","Venezuela, RB","Virgin Islands (U.S.)","Vietnam","Vanuatu","West Bank
                            and Gaza","Samoa","Yemen, Rep.","South Africa","Congo, Dem. Rep.","Zambia","Zimbabwe")
Codes_2012_Dataset <-
  c("ABW","AFG","AGO","ALB","ARE","ARG","ARM","ATG","AUS","AUT","AZE","BDI","BEL","BEN","BFA","
    BGD","BGR","BHR","BHS","BIH","BLR","BLZ","BMU","BOL","BRA","BRB","BRN","BTN","BWA","CAF","CA
    N","CHE","CHL","CHN","CIV","CMR","COG","COL","COM","CPV","CRI","CUB","CYM","CYP","CZE","DEU",
    "DJI","DNK","DOM","DZA","ECU","EGY","ERI","ESP","EST","ETH","FIN","FJI","FRA","FSM","GAB","GBR","
    GEO","GHA","GIN","GMB","GNB","GNQ","GRC","GRD","GRL","GTM","GUM","GUY","HKG","HND","HRV"
    ,"HTI","HUN","IDN","IND","IRL","IRN","IRQ","ISL","ISR","ITA","JAM","JOR","JPN","KAZ","KEN","KGZ","KH
    M","KIR","KOR","KWT","LAO","LBN","LBR","LBY","LCA","LIE","LKA","LSO","LTU","LUX","LVA","MAC","M
    AR","MDA","MDG","MDV","MEX","MKD","MLI","MLT","MMR","MNE","MNG","MOZ","MRT","MUS","M
    WI","MYS","NAM","NCL","NER","NGA","NIC","NLD","NOR","NPL","NZL","OMN","PAK","PAN","PER","PH
    L","PNG","POL","PRI","PRT","PRY","PYF","QAT","ROU","RUS","RWA","SAU","SDN","SEN","SGP","SLB","S
    LE","SLV","SOM","SRB","SSD","STP","SUR","SVK","SVN","SWE","SWZ","SYC","SYR","TCD","TGO","THA","
    TJK","TKM","TLS","TON","TTO","TUN","TUR","TZA","UGA","UKR","URY","USA","UZB","VCT","VEN","VIR"
    ,"VNM","VUT","PSE","WSM","YEM","ZAF","COD","ZMB","ZWE")
Regions_2012_Dataset <- c("The Americas","Asia","Africa","Europe","Middle East","The
                          Americas","Asia","The
                          Americas","Oceania","Europe","Asia","Africa","Europe","Africa","Africa","Asia","Europe","Middle
                          East","The Americas","Europe","Europe","The Americas","The Americas","The Americas","The
                          Americas","The Americas","Asia","Asia","Africa","Africa","The Americas","Europe","The
                          Americas","Asia","Africa","Africa","Africa","The Americas","Africa","Africa","The Americas","TheAmericas","The Americas","Europe","Europe","Europe","Africa","Europe","The Americas","Africa","The
                          Americas","Africa","Africa","Europe","Europe","Africa","Europe","Oceania","Europe","Oceania","Africa"
                          ,"Europe","Asia","Africa","Africa","Africa","Africa","Africa","Europe","The Americas","The
                          Americas","The Americas","Oceania","The Americas","Asia","The Americas","Europe","The
                          Americas","Europe","Asia","Asia","Europe","Middle East","Middle East","Europe","Middle
                          East","Europe","The Americas","Middle
                          East","Asia","Asia","Africa","Asia","Asia","Oceania","Asia","Middle East","Asia","Middle
                          East","Africa","Africa","The
                          Americas","Europe","Asia","Africa","Europe","Europe","Europe","Asia","Africa","Europe","Africa","Asia"
                          ,"The
                          Americas","Europe","Africa","Europe","Asia","Europe","Asia","Africa","Africa","Africa","Africa","Asia","A
                          frica","Oceania","Africa","Africa","The Americas","Europe","Europe","Asia","Oceania","Middle
                          East","Asia","The Americas","The Americas","Asia","Oceania","Europe","The Americas","Europe","The
                          Americas","Oceania","Middle East","Europe","Europe","Africa","Middle
                          East","Africa","Africa","Asia","Oceania","Africa","The Americas","Africa","Europe","Africa","Africa","The
                          Americas","Europe","Europe","Europe","Africa","Africa","Middle
                          East","Africa","Africa","Asia","Asia","Asia","Asia","Oceania","The
                          Americas","Africa","Europe","Africa","Africa","Europe","The Americas","The Americas","Asia","The
                          Americas","The Americas","The Americas","Asia","Oceania","Middle East","Oceania","Middle
                          East","Africa","Africa","Africa","Africa")
mydf <- data.frame(Countries_2012_Dataset,
                   Codes_2012_Dataset,
                   Regions_2012_Dataset)
head(mydf)
colnames(mydf)
colnames(mydf) <- c("Country","Code","Region")
summary(mydf)
#--- merging DFs
head(stats)
head(mydf)
merged <- merge(stats,mydf,by.x="Country.Code",by.y="Code")
head(merged)
merged$Country <- NULL #why
head(merged)
str(merged)
tail(merged)
#--- Visualizing#install.packages("ggplot2")
#library(ggplot2)
qplot(data=merged,x=Internet.users,y=Birth.rate)
#qplot(data=merged,x=Internet.users,y=Birth.rate,
# colour=Region)
#1. Shapes
qplot(data=merged,x=Internet.users,y=Birth.rate,
      colour=Region, size=I(5))
#*** 4
qplot(data=merged,x=Internet.users,y=Birth.rate,
      colour=Region, size=I(5),shape=I(7))
#shapes r from 0 to 25
qplot(data=merged,x=Internet.users,y=Birth.rate,
      colour=Region, size=I(5),shape=I(2))
qplot(data=merged,x=Internet.users,y=Birth.rate,
      colour=Region, size=I(5),shape=I(15))
qplot(data=merged,x=Internet.users,y=Birth.rate,
      colour=Region, size=I(5),shape=I(23))#2. Transparency
qplot(data=merged,x=Internet.users,y=Birth.rate,
      colour=Region, size=I(5),shape=I(19),
      alpha=I(0.1))
qplot(data=merged,x=Internet.users,y=Birth.rate,
      colour=Region, size=I(5),shape=I(19),
      alpha=I(0.6))# notice overlap pts
qplot(data=merged,x=Internet.users,y=Birth.rate,
      colour=Region, size=I(5),shape=I(19),
      alpha=I(0.6), main="Birth Rate vs Internet Users")