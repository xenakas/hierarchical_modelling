data = read.csv(file="/home/xenakas/Desktop/Git/hierarchical_modelling/grouped_ts/gdp_us_state_ind.csv", header = TRUE, sep = ",")

data = data[1:51, ]

View(tail(data))

library(hts)
  

rownames(data) = as.Date(data[,1])
rownames(data)
data$date <- NULL

colnames(data)

y = hts(data, characters = c(2,3))

s = smatrix(y)

View(head(s,52))

plot(y, levels = c(0, 1, 2))


gdpforecast <- forecast(y, h=10, method="bu")

plot(gdpforecast, include=10)



allts <- aggts(y)
allf <- matrix(, nrow=10, ncol=ncol(allts))

# Select preferred time-series forecasting method for each time series

for(i in 1:ncol(allts))
  allf[,i] <- forecast(auto.arima(allts[,i]), h=10, PI=FALSE)$mean
allf <- ts(allf)

# combine the forecasts with the group matrix to get a gts object
g <- get_nodes(y)
y.f <- combinef(allf, nodes = g)

plot(y.f)






