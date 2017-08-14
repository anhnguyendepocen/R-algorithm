1.
> library(data.table)

> dt<-data.table(read.csv("getdata%2Fdata%2Fss06hid.csv"))
> varnames <- names(dt)
> varnamesplit <- strsplit(varnames, "wgtp")
> varnamesplit[[123]]
[1] ""   "15"

2.
> quiz2 <- data.table(read.csv("FGDP.csv"))
> head(quiz2) #see their col names, values(number/character/na)
     X Gross.domestic.product.2012 X.1           X.2          X.3 X.4 X.5 X.6 X.7 X.8
1:                                  NA                                 NA  NA  NA  NA
2:                                  NA               (millions of      NA  NA  NA  NA
3:                         Ranking  NA       Economy  US dollars)      NA  NA  NA  NA
4:                                  NA                                 NA  NA  NA  NA
5: USA                           1  NA United States  16,244,600       NA  NA  NA  NA
6: CHN                           2  NA         China   8,227,103       NA  NA  NA  NA
> quiz2 <- data.table(read.csv("FGDP.csv", skip = 4, nrows = 214, stringsAsFactors = FALSE))
       X X.1 X.2                       X.3          X.4 X.5 X.6 X.7 X.8 X.9
  1: USA   1  NA             United States  16,244,600       NA  NA  NA  NA
  2: CHN   2  NA                     China   8,227,103       NA  NA  NA  NA
  3: JPN   3  NA                     Japan   5,959,718       NA  NA  NA  NA
  4: DEU   4  NA                   Germany   3,428,131       NA  NA  NA  NA
  5: FRA   5  NA                    France   2,612,878       NA  NA  NA  NA
 ---                                                                       
210: SXM  NA  NA Sint Maarten (Dutch part)           ..      NA  NA  NA  NA
211: SOM  NA  NA                   Somalia           ..      NA  NA  NA  NA
212: MAF  NA  NA  St. Martin (French part)           ..      NA  NA  NA  NA
213: TCA  NA  NA  Turks and Caicos Islands           ..      NA  NA  NA  NA
214: VIR  NA  NA     Virgin Islands (U.S.)           ..      NA  NA  NA  NA
> quiz2 <- quiz2[, list(X, X.1, X.2, X.3, X.4)]  #only select these 5 cols as lists
> quiz2
       X X.1 X.2                       X.3          X.4
  1: USA   1  NA             United States  16,244,600 
  2: CHN   2  NA                     China   8,227,103 
  3: JPN   3  NA                     Japan   5,959,718 
  4: DEU   4  NA                   Germany   3,428,131 
  5: FRA   5  NA                    France   2,612,878 
 ---                                                   
209: SXM  NA  NA Sint Maarten (Dutch part)           ..
210: SOM  NA  NA                   Somalia           ..
211: MAF  NA  NA  St. Martin (French part)           ..
212: TCA  NA  NA  Turks and Caicos Islands           ..
213: VIR  NA  NA     Virgin Islands (U.S.)           ..
> setnames(quiz2, c("X","X.1","X.3","X.4"), c("CountryCode","ranking","fullname","gdp"))
> gdp <- as.numeric(gsub(",","", quiz2$gdp))#pattern replace gsub(old, replacement, file)
Warning message:
NAs introduced by coercion 
> mean(gdp, na.rm = TRUE)  #calculating average, ignoring na
[1] 377652.4

3.
> isUnited <- grepl("^United", quiz2$Lon.Name)
> summary(isUnited)
   Mode   FALSE    TRUE 
logical     210       3

4.
> dt_3 <- merge(quiz2, quiz3_c, all = TRUE, by = c("CountryCode"))
> isFiscalYearEnd <- grepl("fiscal year end", tolower(dt_3$Special.Notes))
> isJune <- grepl("june", tolower(dt_3$Special.Notes))
> table(isFiscalYearEnd, isJune)
               isJune
isFiscalYearEnd FALSE TRUE
          FALSE   203    3
          TRUE     19   13
          
5.
>sampleTimes <- index(amzn)
>addmargins(table(year(sampleTimes), weekdays(sampleTimes)))          
