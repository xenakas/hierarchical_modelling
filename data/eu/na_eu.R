# install.packages("eurostat")

library(eurostat)
library(lubridate)

?get_eurostat

dat <- get_eurostat(id="namq_10_a10", time_format="date")

write.csv(dat, file = "namq_unlabelled.csv")

tablename = label_eurostat_tables("namq_10_a10", lang = "en")
colname = label_eurostat_vars(dat, lang = "en")
name = label_eurostat(dat)

write.csv(name, file = "namq_labelled.csv")

na_item <- unique(dat$na_item)
na_item 

s_adj <- unique(dat$s_adj, incomparables = FALSE)
s_adj

#dat_ca <- subset(dat, dat$s_adj==s_adj[1])  # Calendar adjusted data, not seasonally adjusted data
dat_ua <- subset(dat, dat$s_adj==s_adj[2])  # Unadjusted data (i.e. neither seasonally adjusted nor calendar adjusted data)
#dat_sa <- subset(dat, dat$s_adj==s_adj[3]) # Seasonally adjusted data, not calendar adjusted data                         
#dat_sca <- subset(dat, dat$s_adj==s_adj[4]) # Seasonally and calendar adjusted data  

unit <- unique(dat$unit, incomparables = FALSE)
unit 

dat_1 <- subset(dat_ua, dat_ua$unit==unit[1])  # [1] Chain linked volumes (2005), million euro                                                                     
#dat_2 <- subset(dat_ua, dat_ua$unit==unit[2]) # [2] Chain linked volumes (2005), million units of national currency                                               
#dat_3 <- subset(dat_ua, dat_ua$unit==unit[3]) # [3] Chain linked volumes (2010), million euro                                                                     
#dat_4 <- subset(dat_ua, dat_ua$unit==unit[4]) # [4] Chain linked volumes (2010), million units of national currency 

############################ Chain linked volumes (2005), million euro + Unadjusted data ########################################
dat_1$unit <- NULL
dat_1$s_adj <- NULL
dat_1$na_item <- NULL

geo <- unique(dat$geo, incomparables = FALSE) 
geo

nace <- unique(dat$nace_r2, incomparables = FALSE)
nace

dat_1

write.csv(dat_1, file = "gdp_eu.csv")

# nace_list <- list()
# for (i  in 1:length(nace) ) {
#   nace_list[[nace[i]]] <-  subset(dat_1, dat_1$nace_r2 == nace[i])
#   nace_list[[nace[i]]]$nace_r2 <- NULL
#       }

geo_list <- list()
for (i  in 1:length(geo) ) {
  geo_list[[geo[i]]] <-  subset(dat_1, dat_1$geo == geo[i])
  geo_list[[geo[i]]]$geo <- NULL
}

library(zoo)
library(xts)

??xts


main_list <- list()
for (i  in 1:length(geo) ) {
  main_list[[i]] <- list()
  for (j in 1:length(nace)){
  main_list[[i]][[j]] <- subset(geo_list[[i]], geo_list[[i]]$nace_r2 == nace[j])
  main_list[[i]][[j]]$nace_r2 <- NULL
  }
}


main_list[[11]][[2]]

# library(forecast)
# ggtsdisplay(main_list[[3]][[2]])

library(ggplot2)


ggplot(as.data.frame(main_list[[3]]))

date <- rev(seq(as.Date("1980-01-01"), as.Date("2018-04-01"), by="quarters") )




main_list[[12]]

for(i in 1:length(geo)){
  the_main_list[[i]] <- matrix(ncol = length(nace)+1, nrow = length(main_list[[i]][[1]]$values))
  for (j in 1:length(nace)){
    the_main_list[[i]][,j+1] <- main_list[[i]][[j]]$values
  }
  the_main_list[[i]] <- data.frame(the_main_list[[i]])
  colnames(the_main_list[[i]]) <- c("time", as.character(nace))
  the_main_list[[i]]$time <- main_list[[i]][[1]]$time    
  }




ts.plot(the_main_list[[15]])

main_list[[i]][[j]]<-xts(main_list[[i]][[j]]$values, as.Date(main_list[[i]][[j]]$time, format='%Y-%m-%d'))



#http://ec.europa.eu/eurostat/ramon/nomenclatures/index.cfm?TargetUrl=LST_NOM_DTL&StrNom=CL_NACE2&StrLanguageCode=EN&IntPcKey=&StrLayoutCode=HIERARCHIC





