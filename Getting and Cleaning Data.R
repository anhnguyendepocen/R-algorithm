1.#The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:

#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv

#and load the data into R. The code book, describing the variable names is here:

#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf

#Create a logical vector that identifies the households on greater than 10 acres who sold more than $10,000 worth of agriculture products. Assign that logical vector to the variable agricultureLogical. Apply the which() function like this to identify the rows of the data frame where the logical vector is TRUE.

#which(agricultureLogical)

#What are the first 3 values that result?
> setwd("E:\\R\\Getting and Cleaning Data")
> library(jpeg)
> library(data.table)
> library(dplyr)

> fileUrl<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
> download.file(fileUrl, destfile = "06hid.csv")
> quiz1 <- read.csv("06hid.csv")
> agricultureLogical <- quiz1$ACR == 3 & quiz1$AGS == 6
> which(agricultureLogical)
 [1]  125  238  262  470  555  568  608  643  787  808  824  849  952  955 1033
[16] 1265 1275 1315 1388 1607 1629 1651 1856 1919 2101 2194 2403 2443 2539 2580
[31] 2655 2680 2740 2838 2965 3131 3133 3163 3291 3370 3402 3585 3652 3852 3862
[46] 3912 4023 4045 4107 4113 4117 4185 4198 4310 4343 4354 4448 4453 4461 4718
[61] 4817 4835 4910 5140 5199 5236 5326 5417 5531 5574 5894 6033 6044 6089 6275
[76] 6376 6420

2.
> fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
> download.file(fileUrl, destfile = "jeff.jpg")
> data2 <- readJPEG("jeff.jpg",native = TRUE)
le(data2, probs = c(0.3, 0.8))
      30%       80% 
-16776939 -10092545 

3.
> library("data.table")
> fileUrl2 <-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
> fileUrl3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv" 
> FGDP <- data.table::fread(fileUrl2,skip = 4, nrow = 190, select = c(1,2,4,5), col.names = c("CountryCode","Rank","Economy","Total"))
> COUNTRY <- data.table::fread(fileUrl3)
> mergedDT <- merge(FGDP, COUNTRY, by = "CountryCode")
> nrow(mergedDT)
[1] 189

4.
> tapply(mergedDT$Rank, mergedDT$`Income Group`, mean)
High income: nonOECD    High income: OECD           Low income 
            91.91304             32.96667            133.72973 
 Lower middle income  Upper middle income 
           107.70370             92.13333 
