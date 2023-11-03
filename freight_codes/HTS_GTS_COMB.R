## ----------------------------------------------------
library(mvtsplot)
library(forecast)
library(hts)  
library(dplyr)
library(data.table)
library(ggplot2)
library(tidyverse)
library(bsts) 
library(seastests)
library(parallel)
library(doSNOW)
library(doParallel)
library(hexbin)
library(sf)
registerDoParallel(cores=10)


## ----------------------------------------------------
data = read.csv('hts_NGPUP.csv')
data = as.data.table(data)
nn = seq(as.Date("2012-01-01"), by = "month", length.out = 105)
data = data[,2:dim(data)[2]]
rownames(data) = nn 


## ----------------------------------------------------
df= data.frame(Names = colnames(data))


df = df %>%
  mutate(NamesN = substr(Names, 1,2)) %>%  
  mutate(NamesE = substr(Names, 3,3)) %>% 
  mutate(NamesRN = substr(Names, 4,4+7))  %>% 
  mutate(df, new_names = paste(NamesN,NamesE,NamesRN, sep='')) 


## ----------------------------------------------------
df['COMB']='ДРУГ' #CHECK!


## ----------------------------------------------------
# УГ - Группа Б: Каменный уголь
# КО - Группа Г: Кокс
# НН - Группа Е: Нефть и нефтепродукты
# РЖ - Группа Ц: Руда железная и марганцевая
# РЦ - Группа Ш: Руда цветная и серное сырье
# ЧМ - Группа АА: Черные металлы    
# ЛМ - Группа АГ: Лом черных металлов
# УД - Группа АМ: Химические и минеральные удобрения
# СГ - Группа АЦ: Строительные грузы
# ЦЕ - Группа АШ: Цемент 
# ЛГ - Группа ББ: Лесные грузы
# ЗП - Группа ГЕ: Зерно (01,02) + Группа ГЗ: Продукты перемола (50)
# КК - Группа ГО: Комбикорма
# РЫ - Группа БР: Рыба
# ПР - Группа ГФ: Импортные грузы + Прочие грузы


## ----------------------------------------------------
# ЦФО
cfo = c("Белгоро", "Брянска", "Владими", "Воронеж", "Ивановс",
    "Калужск", "Костром", "Курская", "Липецка", "Москвас",
    "Московс", "Орловск", "Рязанск", "Смоленс", "Тамбовс",
    "Тверска", "Тульска", "Ярослав")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "ЦФОX"

# СЗФО
cfo = c("Карелия", "КомиРес", "Арханге", "Вологод", "Калинин",
    "Ленингр", "Мурманс", "Новгоро", "Псковск", "СанктПе")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "СЗФО"

# ЮФО
cfo = c("АдыгеяА", "Калмыки", "Астраха", "Краснод", "Волгогр", "Ростовс")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "ЮФОX"

# СКФО
cfo = c("Дагеста", "Кабарди", "Карачае", "Северна", "Чеченск", "Ставроп", "Ингушет")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "СКФО"

# ПФО
cfo = c("Башкорт", "МарийЭл", "Мордови", "Татарст", "Удмуртс",
    "Чувашск", "Пермски", "Кировск", "Нижегор", "Оренбур",
    "Пензенс", "Самарск", "Саратов", "Ульянов")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "ПФОX"

# УФО
cfo = c("Курганс", "Свердло", "Тюменск", "Челябин", "ХантыМа", "ЯмалоНе")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "УФОX"

# СФО
cfo = c("Алтайск", "Хакасия", "Красноя", "Иркутск", "Кемеров",
    "Новосиб", "Омскаяо", "Томская")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "СФОX"

# ДФО
cfo = c("Амурска", "СахаЯку", "Бурятия", "Забайка", "Приморс",
    "Хабаров", "Еврейск", "Сахалин")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "ДФОX"

# СУБРФ
cfo = c("Субъект", "РОССИЯX")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "РФХХ"

# ЕВР
cfo = c("БЕЛЬГИЯ", "БОЛГАРИ", "ВЕНГРИЯ", "ГЕРМАНИ", "ГРЕЦИЯX",
    "ДАНИЯXX", "ИРЛАНДИ", "ИСПАНИЯ", "ИТАЛИЯX", "КИПРXXX",
    "ЛАТВИЯX", "ЛИТВАXX", "НИДЕРЛА", "ПОЛЬШАX", "РУМЫНИЯ",
    "СЛОВАКИ", "ФИНЛЯНД", "ФРАНЦИЯ", "ХОРВАТИ", "ЧЕХИЯXX",
    "ЧЕШСКАЯ", "ШВЕЙЦАР", "ШВЕЦИЯX", "ЭСТОНИЯ", "МАКЕДОН",
    "МОЛДОВА", "НОРВЕГИ", "БОСНИЯИ", "ВЕЛИКОБ", "СЕРБИЯX",
    "УКРАИНА", #onlyugol
    "СЛОВЕНИ", "АВСТРИЯ", "АЛБАНИЯ", "ПОРТУГА", "ЛЮКСЕМБ", 
    "ФАРЕРСК", "ЧЕРНОГО", "ИСЛАНДИ", "МАЛЬТАX")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "ЕВРО"

# АМЕРИКА
cfo = c("КАНАДАX", "СОЕДИНЕ", "БРАЗИЛИ", #only ugol
    "АРГЕНТИ",
    "БОЛИВИЯ", "МЕКСИКА", "АМЕРИКА", "ВЕНЕСУЭ", "КОЛУМБИ",
    "ПАРАГВА", "ПЕРУXXX", "СУРИНАМ", "СЕНМАРТ", "УРУГВАЙ",
    "ЧИЛИXXX", "ЭКВАДОР", "КЮРАСАО", "ПУЭРТОР", "БАРБАДО",
    "БЕЛИЗXX", "АНГИЛЬЯ", "ГАИТИXX", "ГВАТЕМА", "ЭЛЬСАЛЬ",
    "ГОНДУРА", "ДОМИНИК", "КОСТАРИ", "КУБАXXX", "НИКАРАГ",
    "ПАНАМАX", "СЕНТКИТ", "ТРИНИДА", "ЯМАЙКАX", "ФРАНЦУЗ")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "АМЕР"


# КИТАЙ
cfo = c("КИТАЙXX", "ТАЙВАНЬ", "ГОНКОНГ")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "КИТА"

# ИНДИЯ
cfo = c("ИНДИЯXX", "БАНГЛАД", "ШРИЛАНК")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "ИНДИ"

# АФРИКА (+СР ВОСТОК)
cfo = c("АЛЖИРXX", "ЕГИПЕТX", "ЮЖНАЯАФ", "ТУРЦИЯX", "ИЗРАИЛЬ",
    "ИРАНXXX", "ОБЪЕДИН", "ОМАНXXX", #only ugol
    "АНГОЛАX",
    "ИОРДАНИ", "ИРАКXXX", "ЙЕМЕНXX", "КАТАРXX", "КЕНИЯXX",
    "ЛИВАНXX", "ЛИВИЯXX", "РУАНДАX", "НИГЕРИЯ", "САУДОВС",
    "ТУНИСXX", "ЭФИОПИЯ", "СИРИЯXX", "ПАЛЕСТИ", "СИРИЙСК",
    "БЕНИНXX", "БУРКИНА", "ГАБОНXX", "ГАМБИЯX", "ГАНАXXX",
    "СЕНЕГАЛ", "ГВИНЕЯX", "ГВИНЕЯБ", "ДЖИБУТИ", "ВИРГИНС",
    "ГАЙАНАX", "КУВЕЙТX", "ЗАМБИЯX", "ЗИМБАБВ", "КАБОВЕР",
    "КАМЕРУН", "КОНГО.Д", "КОНГОXX", "КОТД.ИВ", "ЛИБЕРИЯ",
    "МАВРИКИ", "МАВРИТА", "МАДАГАС", "МАЙОТТА", "МАЛАВИX",
    "МАЛИXXX", "МАРОККО", "МОЗАМБИ", "НАМИБИЯ", "НИГЕРXX",
    "СУДАНXX", "СЬЕРРАЛ", "ТАНЗАНИ", "ТОГОXXX", "БАХРЕЙН",
    "БРИТАНС", "ВИРГИНС", "УГАНДАX", "ЦЕНТРАЛ", "ЭКВАТОР",
    "ЭРИТРЕЯ")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "АФСВ"

# АТР
cfo = c("ВЬЕТНАМ", "СИНГАПУ", "ТАИЛАНД", "КОРЕЯ.X", "КОРЕЯ.Н",
    "КОРЕЯКН", "ЯПОНИЯX", "ИНДОНЕЗ", "ФИЛИППИ", #only ugol
    "АВСТРАЛ", "НОВАЯЗЕ", "СЕЙШЕЛЫ", "КАМБОДЖ", "ЛАОСXXX",
    "МАЛАЙЗИ", "МАЛЬДИВ", "МЬЯНМАX", "НЕПАЛXX", "НОВАЯКА",
    "ОСТРОВА", "ОСТРОВК", "ПАПУАНО", "СЕЙШЕЛЫ", "ФИДЖИXX")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "АТРX"

# ЕАЭС
cfo = c("АРМЕНИЯ", "БЕЛАРУС", "КАЗАХСТ", "КИРГИЗИ")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "ЕАЭС"

# ВОСТ
cfo = c("АЗЕРБАЙ", "ТУРКМЕН", "УЗБЕКИС", "ГРУЗИЯX", #only ugol
    "АФГАНИС", "ТАДЖИКИ", "ПАКИСТА", "МОНГОЛИ")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "ВОСТ"

df = df %>%
  mutate(df, new_names_comb = paste(NamesN,NamesE,COMB, sep='')) %>%
    mutate(df, new_names_comb_2 = paste(NamesN,NamesE,COMB, NamesRN,  sep=''))


## ----------------------------------------------------
data <- t(aggregate(t(data), list(df[['new_names_comb']]), FUN = sum))
colnames(data)<-data[1,] 
data<-data[2:106,]
data <- data.frame(sapply(data.frame(data), function(x) as.numeric(as.character(x))))
data = as.data.table(data)
nn = seq(as.Date("2012-01-01"), by = "month", length.out = 105)
data = data[,2:dim(data)[2]]
rownames(data) = nn


## ----------------------------------------------------
y = hts(data, characters = c(2,1,4))


## ----------------------------------------------------
plot(y)


## ----------------------------------------------------
data_f5_plt = data
data_f5_plt <- ts(data,start = c(2012,1),frequency = 12)
y_f5_plt<-hts(data_f5_plt, characters = c(2,1,4))
names(y_f5_plt$labels) <- c( 'Уровень 1. Объем грузоперевозок по РФ',
'Уровень 2. Объем грузоперевозок по товарным группам НГПУП',
'Уровень 3. Объем грузоперевозок по НГПУП с разбивкой на внутр./экспортные перевозки',
'Уровень 4. Агрегированный регион назначения')
plot(y_f5_plt, levels = c(0, 1, 2,3))


## ----------------------------------------------------
plot(y, level=1)


## ----------------------------------------------------
y =  hts(data, characters = c(2,1,4))


## ----------------------------------------------------
plot(y, levels = c(0, 1, 2, 3), color_lab = TRUE )


## ----------------------------------------------------
gdpforecast <- forecast(gts_train, h=9, weights = "wls", method="comb", fmethod = "rw")


## ----------------------------------------------------
plot(gdpforecast)


## ----------------------------------------------------
tab = accuracy.gts(gdpforecast, gts_test)


## ----------------------------------------------------
nnames <- get_nodes(y)


## ----------------------------------------------------
tab


## ----------------------------------------------------
# A function to calculate No. of groups at each level
Mlevel <- function(xgroup) {
  m <- apply(xgroup, 1, function(x) length(unique(x)))
  return(m)
}

# A function to return the NO. of nodes at each level
Mnodes <- function(xlist) {
  m <- c(unlist(lapply(xlist, length)), sum(xlist[[length(xlist)]]))
  return(m)
}


## ----------------------------------------------------
nnumb<-Mnodes(y$nodes)


## ----------------------------------------------------
rw_hts <- data.frame(u1=tab[1:3,cumsum(nnumb)[1]],
u2=rowSums(tab[1:3,(cumsum(nnumb)[1]+1):cumsum(nnumb)[2]]),
u3=rowSums(tab[1:3,(cumsum(nnumb)[2]+1):cumsum(nnumb)[3]]),
u4=rowSums(tab[1:3,(cumsum(nnumb)[3]+1):cumsum(nnumb)[4]]))
rw_hts


## ----------------------------------------------------
allts <- aggts(gts_train)


## ----------------------------------------------------
allf <- matrix(, nrow=9, ncol=ncol(allts))
# Select preferred time-series forecasting method for each time series
for(i in 1:ncol(allts)){
    allf[,i] <- thetaf(allts[,i], h=9)$mean
}
allf <- ts(allf)


## ----------------------------------------------------
colnames(allf)  <-   colnames(allts)  


## ----------------------------------------------------
# combine the forecasts with the group matrix to get a gts object
g <- get_nodes(gts_train)
y.f <- combinef(allf, nodes = g)


## ----------------------------------------------------
forecasts_7 = y.f[[1]]


## ----------------------------------------------------
colnames(forecasts_7) = colnames(y[[1]])


## ----------------------------------------------------
data_f5 = rbind(gts_train[[1]], forecasts_7)


## ----------------------------------------------------
y_f5 = hts(data_f5, characters = c(2,1,4))


plot(y_f5, levels = c(0, 1, 2,3))


## ----------------------------------------------------
gts_forecasts_7  <- window(y_f5, start=(105-9+1), end=105)


## ----------------------------------------------------
tab = accuracy.gts(gts_forecasts_7, gts_test)


## ----------------------------------------------------
tab


## ----------------------------------------------------
th_hts <- data.frame(u1=tab[1:3,cumsum(nnumb)[1]],
u2=rowSums(tab[1:3,(cumsum(nnumb)[1]+1):cumsum(nnumb)[2]]),
u3=rowSums(tab[1:3,(cumsum(nnumb)[2]+1):cumsum(nnumb)[3]]),
u4=rowSums(tab[1:3,(cumsum(nnumb)[3]+1):cumsum(nnumb)[4]]))
rw_hts
th_hts


## ----------------------------------------------------
allts <- aggts(gts_train)


## ----------------------------------------------------
(model_components <- list())


## ----------------------------------------------------
i = 1


## ----------------------------------------------------
one <- allts[,i]


## ----------------------------------------------------
burnin <- 500 
model_components <- AddLocalLinearTrend(model_components, 
                                        y = one)
model_components <- AddSeasonal(model_components, y = one, 
                                  nseasons  = 12)


## ----------------------------------------------------
hnum = 37
simsim <- foreach(i = 1:ncol(allts)) %dopar% {

    model_components <- list()

    one <- allts[, i]


    fmod = "NA"

    if (all(allts[(96 - 11):96, i] == 0)) {

        # ret <- thetaf(allts[, i], h = 9)$mean

        # fmod = 'theta'

        ret <- rep(0, hnum)

        fmod = "RW"


    } else {

        stest = combined_test(one, freq = 12)
        stest = stest$Pval[3] < 0.05


        if (stest) {

            model_components <- AddLocalLinearTrend(model_components, y = one)
            model_components <- AddSeasonal(model_components, y = one, nseasons = 12)


            fit <- bsts(one, model_components, niter = 2000)

            pred <- predict(fit, horizon = hnum, burn = burnin, quantiles = c(0.05,
                0.95))

            ret <- pred$mean


            fmod = "TS"


        } else {

            model_components <- AddLocalLinearTrend(model_components, y = one)


            fit <- bsts(one, model_components, niter = 2000)

            pred <- predict(fit, horizon = hnum, burn = burnin, quantiles = c(0.05,
                0.95))

            ret <- pred$mean

            fmod = "T"


        }




    }




    ret_all = list()
    ret_all[[1]] = ret
    ret_all[[2]] = fmod

    ret_all


}


## ----------------------------------------------------
###################
simsim_df <- as.data.frame(matrix(NA, nrow = hnum, ncol = 0))
###################
for (i in 1:length(simsim)) {
    if (simsim[[i]][[2]]!='theta'){
          simsim_df <- cbind(simsim_df, simsim[[i]][[1]])
    }else{
          simsim_df <- cbind(simsim_df, rep(0,hnum))    
    }
    
}


## ----------------------------------------------------
allf = simsim_df


## ----------------------------------------------------
colnames(allf)  <-   colnames(allts)  


## ----------------------------------------------------
allf[allf<0] = 0


## ----------------------------------------------------
# combine the forecasts with the group matrix to get a gts object
g <- get_nodes(gts_train)
y.f <- combinef(allf[1:9,], nodes = g)


## ----------------------------------------------------
forecasts_7 = y.f[[1]]


## ----------------------------------------------------
colnames(forecasts_7) = colnames(y[[1]])


## ----------------------------------------------------
data_f5 = rbind(gts_train[[1]], forecasts_7)


## ----------------------------------------------------
y_f5 = hts(data_f5, characters = c(2,1,4))
plot(y_f5, levels = c(0, 1, 2,3))


## ----------------------------------------------------
data_f5_plt = data[(105-9+1):105,]
data_f5_plt <- ts(data_f5_plt,start = c(2020,1),frequency = 12)
y_f5_plt<-hts(data_f5_plt, characters = c(2,1,4))
names(y_f5_plt$labels) <- c( 'ФАКТ\nУровень 1. Объем грузоперевозок по РФ',
'Уровень 2. Объем грузоперевозок по товарным группам НГПУП',
'Уровень 3. Объем грузоперевозок по НГПУП с разбивкой на внутр./экспортные перевозки',
'Уровень 4. Агрегированный регион назначения')


options(repr.plot.width=6, repr.plot.height=8)
plot(y_f5_plt, levels = c(0, 1, 2,3), xlim=c(2020,2020.7))



## ----------------------------------------------------
data_f5_plt = data_f5[(105-9+1):105,]
data_f5_plt <- ts(data_f5_plt,start = c(2020,1),frequency = 12)
y_f5_plt<-hts(data_f5_plt, characters = c(2,1,4))
names(y_f5_plt$labels) <- c( 'ПРОГНОЗ\nУровень 1. Объем грузоперевозок по РФ',
'Уровень 2. Объем грузоперевозок по товарным группам НГПУП',
'Уровень 3. Объем грузоперевозок по НГПУП с разбивкой на внутр./экспортные перевозки',
'Уровень 4. Агрегированный регион назначения')

plot(y_f5_plt, levels = c(0, 1, 2,3),  xlim=c(2020,2020.7))


## ----------------------------------------------------
gts_forecasts_7  <- window(y_f5, start=(105-9+1), end=105)

tab = accuracy.gts(gts_forecasts_7, gts_test)

tab



## ----------------------------------------------------
bsts_hts <- data.frame(u1=tab[1:3,cumsum(nnumb)[1]],
u2=rowSums(tab[1:3,(cumsum(nnumb)[1]+1):cumsum(nnumb)[2]]),
u3=rowSums(tab[1:3,(cumsum(nnumb)[2]+1):cumsum(nnumb)[3]]),
u4=rowSums(tab[1:3,(cumsum(nnumb)[3]+1):cumsum(nnumb)[4]]))


## ----------------------------------------------------
all_hts_tab<-data.frame(rw_hts[,1],
th_hts[,1],
bsts_hts[,1],
rw_hts[,2],
th_hts[,2],
bsts_hts[,2],
rw_hts[,3],
th_hts[,3],
bsts_hts[,3],
rw_hts[,4],
th_hts[,4],
bsts_hts[,4])


## ----------------------------------------------------
row.names(all_hts_tab)<-row.names(bsts_hts)


## ----------------------------------------------------
round(all_hts_tab/1000000,3)


## ----------------------------------------------------
rosst <- read.csv('Pogruzka_04-2023_rosstat.csv',row.names = 1)


## ----------------------------------------------------
rosst<-rosst[,!(names(rosst) %in% c('П','И'))]*1000


## ----------------------------------------------------
round(c(mean((allf[1:12,1]/rowSums(rosst[97:(97+11),])-1)*100),
mean((allf[13:24,1]/rowSums(rosst[(97+12):(97+11+12),])-1)*100),
mean((allf[25:36,1]/rowSums(rosst[(97+12+12):(97+11+12+12),])-1)*100)),2)


## ----------------------------------------------------
ng_rzhd <- allf[1:36,(cumsum(nnumb)[1]+1):cumsum(nnumb)[2]]


## ----------------------------------------------------
ng_rzhd<-ng_rzhd[ , order(names(ng_rzhd))]
ng_ros<-rosst[ , order(names(rosst))]


## ----------------------------------------------------
rossat_true_1 =  aggts(gts_test)


## ----------------------------------------------------
rossat_true_forecasts = rbind(rossat_true_1, rossat_true_forecasts)


## ----------------------------------------------------
diffs <- ng_rzhd[1:36,]/ng_ros[(97):(97+11+12+12),]


## ----------------------------------------------------
dif_year <- data.frame(colMeans(diffs[1:12,], na.rm = TRUE), #2020
colMeans(diffs[13:24,], na.rm = TRUE), #2021
colMeans(diffs[25:36,], na.rm = TRUE)) #2022


## ----------------------------------------------------
colnames(dif_year) <- c(2020,2021,2022)


## ----------------------------------------------------
vn = (dif_year-1)*100


## ----------------------------------------------------
colnames(vn) = c('d2020','d2021','d2022')


## ----------------------------------------------------
vn['reg']=rownames(vn)


## ----------------------------------------------------
vn = vn[order(vn[['d2020']]),]


## ----------------------------------------------------
shares_ngpup = colMeans(ng_ros[(97):(97+11+12+12),])/sum(colMeans(ng_ros[(97):(97+11+12+12),]))


## ----------------------------------------------------
shares_ngpup <- shares_ngpup[(shares_ngpup>0.007)&(names(shares_ngpup)!='ПР')]


## ----------------------------------------------------
shares_ngpup[order(shares_ngpup)]


## ----------------------------------------------------
vn=vn[names(shares_ngpup),]


## ----------------------------------------------------
d1<-data.frame(vn[,c(1,4)],year='2020')
colnames(d1)[1]<-'values'
d2<-data.frame(vn[,c(2,4)],year='2021')
colnames(d2)[1]<-'values'
d3<-data.frame(vn[,c(3,4)],year='2022')
colnames(d3)[1]<-'values'


## ----------------------------------------------------
vn_stack=vn
vn=rbind(d1,d2,d3)


## ----------------------------------------------------
vn_stack


## ----------------------------------------------------
vn[vn['values']>35,'values']=40


## ----------------------------------------------------
ggplot(vn, aes(reg, values, fill = year)) + 
  geom_bar(stat="identity",position=position_dodge2(reverse=TRUE))+ 
  coord_flip() + 
  ylab('FCI') +
  xlab('НГПУП') + scale_fill_discrete(name="") 


## ----------------------------------------------------
data = read.csv('hts_ugol_FINAL.csv')
data = as.data.table(data)
nn = seq(as.Date("2012-01-01"), by = "month", length.out = 105)
data = data[,2:dim(data)[2]]
rownames(data) = nn

df= data.frame(Names = colnames(data))


df = df %>%
  mutate(NamesE = substr(Names, 1,1)) %>%  
  mutate(NamesRO = substr(Names, 1+7+1,1+7+7)) %>% 
  mutate(NamesRN = substr(Names, 1+7+7+3,1+7+7+7+3))  %>% 
  mutate(df, new_names = paste(NamesRO,NamesE,NamesRN, sep='')) 


## ----------------------------------------------------
df['COMB']=''


## ----------------------------------------------------
# ЦФО
cfo = c("Белгоро", "Брянска", "Владими", "Воронеж", "Ивановс",
    "Калужск", "Костром", "Курская", "Липецка", "Москвас",
    "Московс", "Орловск", "Рязанск", "Смоленс", "Тамбовс",
    "Тверска", "Тульска", "Ярослав")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "ЦФОX"

# СЗФО
cfo = c("Карелия", "КомиРес", "Арханге", "Вологод", "Калинин",
    "Ленингр", "Мурманс", "Новгоро", "Псковск", "СанктПе")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "СЗФО"

# ЮФО
cfo = c("АдыгеяА", "Калмыки", "Астраха", "Краснод", "Волгогр", "Ростовс")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "ЮФОX"

# СКФО
cfo = c("Дагеста", "Кабарди", "Карачае", "Северна", "Чеченск", "Ставроп", "Ингушет")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "СКФО"

# ПФО
cfo = c("Башкорт", "МарийЭл", "Мордови", "Татарст", "Удмуртс",
    "Чувашск", "Пермски", "Кировск", "Нижегор", "Оренбур",
    "Пензенс", "Самарск", "Саратов", "Ульянов")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "ПФОX"

# УФО
cfo = c("Курганс", "Свердло", "Тюменск", "Челябин", "ХантыМа", "ЯмалоНе")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "УФОX"

# СФО
cfo = c("Алтайск", "Хакасия", "Красноя", "Иркутск", "Кемеров",
    "Новосиб", "Омскаяо", "Томская")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "СФОX"

# ДФО
cfo = c("Амурска", "СахаЯку", "Бурятия", "Забайка", "Приморс",
    "Хабаров", "Еврейск", "Сахалин")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "ДФОX"

# СУБРФ
cfo = c("Субъект", "РОССИЯX")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "РФХХ"

# ЕВР
cfo = c("БЕЛЬГИЯ", "БОЛГАРИ", "ВЕНГРИЯ", "ГЕРМАНИ", "ГРЕЦИЯX",
    "ДАНИЯXX", "ИРЛАНДИ", "ИСПАНИЯ", "ИТАЛИЯX", "КИПРXXX",
    "ЛАТВИЯX", "ЛИТВАXX", "НИДЕРЛА", "ПОЛЬШАX", "РУМЫНИЯ",
    "СЛОВАКИ", "ФИНЛЯНД", "ФРАНЦИЯ", "ХОРВАТИ", "ЧЕХИЯXX",
    "ЧЕШСКАЯ", "ШВЕЙЦАР", "ШВЕЦИЯX", "ЭСТОНИЯ", "МАКЕДОН",
    "МОЛДОВА", "НОРВЕГИ", "БОСНИЯИ", "ВЕЛИКОБ", "СЕРБИЯX",
    "УКРАИНА", #onlyugol
    "СЛОВЕНИ", "АВСТРИЯ", "АЛБАНИЯ", "ПОРТУГА", "ЛЮКСЕМБ", 
    "ФАРЕРСК", "ЧЕРНОГО", "ИСЛАНДИ", "МАЛЬТАX")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "ЕВРО"

# АМЕРИКА
cfo = c("КАНАДАX", "СОЕДИНЕ", "БРАЗИЛИ", #only ugol
    "АРГЕНТИ",
    "БОЛИВИЯ", "МЕКСИКА", "АМЕРИКА", "ВЕНЕСУЭ", "КОЛУМБИ",
    "ПАРАГВА", "ПЕРУXXX", "СУРИНАМ", "СЕНМАРТ", "УРУГВАЙ",
    "ЧИЛИXXX", "ЭКВАДОР", "КЮРАСАО", "ПУЭРТОР", "БАРБАДО",
    "БЕЛИЗXX", "АНГИЛЬЯ", "ГАИТИXX", "ГВАТЕМА", "ЭЛЬСАЛЬ",
    "ГОНДУРА", "ДОМИНИК", "КОСТАРИ", "КУБАXXX", "НИКАРАГ",
    "ПАНАМАX", "СЕНТКИТ", "ТРИНИДА", "ЯМАЙКАX", "ФРАНЦУЗ")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "АМЕР"


# КИТАЙ
cfo = c("КИТАЙXX", "ТАЙВАНЬ", "ГОНКОНГ")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "КИТА"

# ИНДИЯ
cfo = c("ИНДИЯXX", "БАНГЛАД", "ШРИЛАНК")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "ИНДИ"

# АФРИКА (+СР ВОСТОК)
cfo = c("АЛЖИРXX", "ЕГИПЕТX", "ЮЖНАЯАФ", "ТУРЦИЯX", "ИЗРАИЛЬ",
    "ИРАНXXX", "ОБЪЕДИН", "ОМАНXXX", #only ugol
    "АНГОЛАX",
    "ИОРДАНИ", "ИРАКXXX", "ЙЕМЕНXX", "КАТАРXX", "КЕНИЯXX",
    "ЛИВАНXX", "ЛИВИЯXX", "РУАНДАX", "НИГЕРИЯ", "САУДОВС",
    "ТУНИСXX", "ЭФИОПИЯ", "СИРИЯXX", "ПАЛЕСТИ", "СИРИЙСК",
    "БЕНИНXX", "БУРКИНА", "ГАБОНXX", "ГАМБИЯX", "ГАНАXXX",
    "СЕНЕГАЛ", "ГВИНЕЯX", "ГВИНЕЯБ", "ДЖИБУТИ", "ВИРГИНС",
    "ГАЙАНАX", "КУВЕЙТX", "ЗАМБИЯX", "ЗИМБАБВ", "КАБОВЕР",
    "КАМЕРУН", "КОНГО.Д", "КОНГОXX", "КОТД.ИВ", "ЛИБЕРИЯ",
    "МАВРИКИ", "МАВРИТА", "МАДАГАС", "МАЙОТТА", "МАЛАВИX",
    "МАЛИXXX", "МАРОККО", "МОЗАМБИ", "НАМИБИЯ", "НИГЕРXX",
    "СУДАНXX", "СЬЕРРАЛ", "ТАНЗАНИ", "ТОГОXXX", "БАХРЕЙН",
    "БРИТАНС", "ВИРГИНС", "УГАНДАX", "ЦЕНТРАЛ", "ЭКВАТОР",
    "ЭРИТРЕЯ")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "АФСВ"

# АТР
cfo = c("ВЬЕТНАМ", "СИНГАПУ", "ТАИЛАНД", "КОРЕЯ.X", "КОРЕЯ.Н",
    "КОРЕЯКН", "ЯПОНИЯX", "ИНДОНЕЗ", "ФИЛИППИ", #only ugol
    "АВСТРАЛ", "НОВАЯЗЕ", "СЕЙШЕЛЫ", "КАМБОДЖ", "ЛАОСXXX",
    "МАЛАЙЗИ", "МАЛЬДИВ", "МЬЯНМАX", "НЕПАЛXX", "НОВАЯКА",
    "ОСТРОВА", "ОСТРОВК", "ПАПУАНО", "СЕЙШЕЛЫ", "ФИДЖИXX")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "АТРX"

# ЕАЭС
cfo = c("АРМЕНИЯ", "БЕЛАРУС", "КАЗАХСТ", "КИРГИЗИ")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "ЕАЭС"

# ВОСТ
cfo = c("АЗЕРБАЙ", "ТУРКМЕН", "УЗБЕКИС", "ГРУЗИЯX", #only ugol
    "АФГАНИС", "ТАДЖИКИ", "ПАКИСТА", "МОНГОЛИ")
df[df[, "NamesRN"] %in% cfo, "COMB"] = "ВОСТ"


## ----------------------------------------------------
df = df %>%
  mutate(df, new_names_comb = paste(NamesRO,NamesE,COMB, sep='')) 

colnames(data) = df[['new_names_comb']]


## ----------------------------------------------------
data <- t(aggregate(t(data), list(df[['new_names_comb']]), FUN = sum))
colnames(data)<-data[1,] 
data<-data[2:106,]
data <- data.frame(sapply(data.frame(data), function(x) as.numeric(as.character(x))))
data = as.data.table(data)
nn = seq(as.Date("2012-01-01"), by = "month", length.out = 105)
data = data[,2:dim(data)[2]]
rownames(data) = nn


## ----------------------------------------------------
y = gts(data, characters = list(c(7), c(1,4)), gnames = c("Отпр","ЭИ","Наз","Отпр-ЭИ"))


## ----------------------------------------------------
plot(y)


## ----------------------------------------------------
data_f5_plt = data_f5
data_f5_plt <- ts(data_f5,start = c(2012,1),frequency = 12)
y_f5_plt<-gts(data_f5_plt, characters = list(c(7), c(1,4)), gnames = c("Отпр","ЭИ","Наз","Отпр-ЭИ"))
names(y_f5_plt$labels) <- c('Уровень 2. Объем грузоперевозок угля из региона РФ',
                            "Уровень 2. Объем внутр./экспортных перевозок угля",
                            'Уровень 2. Объем грузоперевозок угля в агрегированный регион',
                            'Уровень 3. Объем грузоперевозок угля из региона РФ с разбивкой на внутр./экспортные перевозки')
plot(y_f5_plt, labels=F)


## ----------------------------------------------------
# A function to calculate No. of groups at each level
Mlevel <- function(xgroup) {
  m <- apply(xgroup, 1, function(x) length(unique(x)))
  return(m)
}


## ----------------------------------------------------
plot.gts <- function(x, include, levels, labels = TRUE,
                     col = NULL, color_lab = FALSE, ...) {
  # Do plotting
  #
  # Args:
  #   x: hts or gts
  #   include: No. of historical data included in the plot.
  #   levels: which level or group to display.
  #   labels: text labels
  #
  # Return:
  #   hts or gts plots
  #
  # Error Handling:
  if (!is.gts(x)) {
    stop("Argument x must be either hts or gts object.", call. = FALSE)
  }

  if (!is.null(x$histy)) {
    histx <- aggts(x, levels, forecasts = FALSE)
    fcasts <- aggts(x, levels, forecasts = TRUE)
  } else {
    histx <- aggts(x, levels)
  }

  if (missing(include)) {
    histx <- histx
    include <- nrow(histx)
  } else {
    tspx <- stats::tsp(histx)
    histx <- stats::window(histx, start = tspx[2L] - include/tspx[3L] + 1L/tspx[3L])
  }

  if (missing(levels)) {
    if (is.hts(x)) {
      levels <- 0L:length(x$nodes)
    } else {
      levels <- 0L:(nrow(x$groups) - 1L)
    }
  }

  l.levels <- length(levels)
  if (is.character(levels)) {
    levels <- which(names(x$labels) %in% levels)
  }
  levels <- as.integer(levels) + 1L

  dots.list <- match.call(expand.dots = FALSE)$`...`
  opar <- par(mfrow = c(l.levels, 1L), mar = c(3, 4, 4, 2))
  on.exit(par(opar))

  if (is.hts(x)) {
    m <- Mnodes(x$nodes)[levels]
  } else {
    m <- Mlevel(x$groups)[levels]
    x$labels <- c("Уровень 1. Объем грузоперевозок по РФ" = "РФ", x$labels, "Уровень 4. Объем грузоперевозок по маршруту" = list(colnames(x$bts)))
  }

  cs <- c(0L, cumsum(m))

  for (i in 1L:l.levels) {
    end <- cs[i + 1L]
    start <- cs[i] + 1L
    series <- seq(start, end)
    if(is.null(col)){
      cols <- grDevices::rainbow(length(series))
    } else {
      cols <- col
    }
    if(!is.null(x$histy)) {
      ylim <- range(histx[, series], fcasts[, series], na.rm = TRUE)
      xlim <- range(time(histx), time(fcasts), na.rm = TRUE)
    } else {
      ylim <- range(histx[, series], na.rm = TRUE)
      xlim <- range(time(histx), na.rm=TRUE)
    }
    if (labels) {
      strlabels <- max(strwidth(x$labels[levels], units = "figure"))
      xlim[1L] <- xlim[1L] - strlabels * diff(xlim) / par()$fin[1]
    }
    if (is.null(dots.list$xlim)) {
      plot(histx[, series, drop = FALSE], col = cols, xlim = xlim, ylim = ylim,
           xlab = "", ylab = "", main = names(x$labels)[levels][i],
           plot.type = "single",
           type = ifelse(length(1:include) == 1L, "p", "l"),
           ...)
    } else {
      plot(histx[, series, drop = FALSE], col = cols, ylim = ylim,
           xlab = "", ylab = "", main = names(x$labels)[levels][i],
           plot.type = "single",
           type = ifelse(length(1:include) == 1L, "p", "l"),
           ...)
    }

    if (!is.null(x$histy)) {
      for (j in 1L:length(series)) {
        lines(fcasts[, series[j], drop = FALSE], lty = 2, col = cols[j],
              type = ifelse(nrow(fcasts) == 1L, "p", "l"))
      }
    }

    if (labels) {
      if(color_lab){
        lab_col <- cols
      } else {
        lab_col <- par()$fg
      }
        
      text(x = stats::tsp(histx)[1L] - 0.02*diff(xlim), y = histx[1L, series],
           labels = unlist(x$labels[levels][i]),
           cex = 0.9, adj = 1, col = lab_col)
    }
  }
}


## ----------------------------------------------------
plot(y, level=3)


## ----------------------------------------------------
plot(y, level=5)


## ----------------------------------------------------
y =  gts(data, characters = list(c(7), c(1,4)), gnames = c("Отпр","ЭИ","Наз","Отпр-ЭИ"))


## ----------------------------------------------------
s = smatrix(y)


## ----------------------------------------------------
gts_train  <- window(y, start=1, end=(105-9))
gts_test  <- window(y, start=(105-9+1), end=105)


## ----------------------------------------------------
plot(y, levels = c(0, 1, 2, 3, 4), color_lab = TRUE )


## ----------------------------------------------------
gdpforecast <- forecast(gts_train, h=9, weights = "wls", method="comb", fmethod = "rw")


## ----------------------------------------------------
plot(gdpforecast)


## ----------------------------------------------------
tab = accuracy.gts(gdpforecast, gts_test)
# tab


## ----------------------------------------------------
nnames <- get_groups(y)


## ----------------------------------------------------
tab


## ----------------------------------------------------
# A function to calculate No. of groups at each level
Mlevel <- function(xgroup) {
  m <- apply(xgroup, 1, function(x) length(unique(x)))
  return(m)
}

# A function to return the NO. of nodes at each level
Mnodes <- function(xlist) {
  m <- c(unlist(lapply(xlist, length)), sum(xlist[[length(xlist)]]))
  return(m)
}


## ----------------------------------------------------
nnumb<-Mlevel(y$groups)
nnumb


## ----------------------------------------------------
# options(digits = 15)

rw_hts <- data.frame(u1=tab[1:3,cumsum(nnumb)[1]],
u2=rowSums(tab[1:3,(cumsum(nnumb)[1]+1):cumsum(nnumb)[2]]),
u3=rowSums(tab[1:3,(cumsum(nnumb)[2]+1):cumsum(nnumb)[3]]),
u4=rowSums(tab[1:3,(cumsum(nnumb)[3]+1):cumsum(nnumb)[4]]),
u5=rowSums(tab[1:3,(cumsum(nnumb)[4]+1):cumsum(nnumb)[5]]),
u6=rowSums(tab[1:3,(cumsum(nnumb)[5]+1):cumsum(nnumb)[6]])                   )
rw_hts


## ----------------------------------------------------
allts <- aggts(gts_train)


## ----------------------------------------------------
allf <- matrix(, nrow=9, ncol=ncol(allts))
# Select preferred time-series forecasting method for each time series
for(i in 1:ncol(allts)){
    allf[,i] <- thetaf(allts[,i], h=9)$mean
}
allf <- ts(allf)


## ----------------------------------------------------
colnames(allf)  <-   colnames(allts)  


## ----------------------------------------------------
# combine the forecasts with the group matrix to get a gts object
g <- get_groups(gts_train)
y.f <- combinef(allf, groups = g)


## ----------------------------------------------------
forecasts_7 = y.f[[1]]


## ----------------------------------------------------
colnames(forecasts_7) = colnames(y[[1]])


## ----------------------------------------------------
data_f5 = rbind(gts_train[[1]], forecasts_7)


## ----------------------------------------------------
y_f5 = gts(data_f5, characters = list(c(7), c(1,4)), gnames = c("Отпр","ЭИ","Наз","Отпр-ЭИ"))

plot(y_f5, levels = c(0, 1, 2,3,4))


## ----------------------------------------------------
gts_forecasts_7  <- window(y_f5, start=(105-9+1), end=105)


## ----------------------------------------------------
tab = accuracy.gts(gts_forecasts_7, gts_test)


## ----------------------------------------------------
tab


## ----------------------------------------------------
nnumb<-Mlevel(y$groups)
nnumb

th_hts <- data.frame(u1=tab[1:3,cumsum(nnumb)[1]],
u2=rowSums(tab[1:3,(cumsum(nnumb)[1]+1):cumsum(nnumb)[2]]),
u3=rowSums(tab[1:3,(cumsum(nnumb)[2]+1):cumsum(nnumb)[3]]),
u4=rowSums(tab[1:3,(cumsum(nnumb)[3]+1):cumsum(nnumb)[4]]),
u5=rowSums(tab[1:3,(cumsum(nnumb)[4]+1):cumsum(nnumb)[5]]),
u6=rowSums(tab[1:3,(cumsum(nnumb)[5]+1):cumsum(nnumb)[6]])                   )
rw_hts
th_hts 
bsts_hts


## ----------------------------------------------------
allts <- aggts(gts_train)


## ----------------------------------------------------
library(tidyverse)
library(bsts) 


## ----------------------------------------------------
(model_components <- list())


## ----------------------------------------------------
i = 1


## ----------------------------------------------------
one <- allts[,i]


## ----------------------------------------------------
burnin <- 500 
model_components <- AddLocalLinearTrend(model_components, 
                                        y = one)
model_components <- AddSeasonal(model_components, y = one, 
                                  nseasons  = 12)


## ----------------------------------------------------
hnum = 37
simsim <- foreach(i = 1:ncol(allts)) %dopar% {

    model_components <- list()

    one <- allts[, i]


    fmod = "NA"

    if (all(allts[(96 - 11):96, i] == 0)) {
        
        ret <- rep(0,hnum)

        fmod = "RW"


    } else {

        stest = combined_test(one, freq = 12)
        stest = stest$Pval[3] < 0.05


        if (stest) {

            model_components <- AddLocalLinearTrend(model_components, y = one)
            model_components <- AddSeasonal(model_components, y = one, nseasons = 12)


            fit <- bsts(one, model_components, niter = 2000)

            pred <- predict(fit, horizon = hnum, burn = burnin, quantiles = c(0.05,
                0.95))

            ret <- pred$mean


            fmod = "TS"


        } else {

            model_components <- AddLocalLinearTrend(model_components, y = one)


            fit <- bsts(one, model_components, niter = 2000)

            pred <- predict(fit, horizon = hnum, burn = burnin, quantiles = c(0.05,
                0.95))

            ret <- pred$mean

            fmod = "T"


        }




    }




    ret_all = list()
    ret_all[[1]] = ret
    ret_all[[2]] = fmod

    ret_all


}


## ----------------------------------------------------
###################
simsim_df <- as.data.frame(matrix(NA, nrow = hnum, ncol = 0))
###################
for (i in 1:length(simsim)) {
    if (simsim[[i]][[2]]!='theta'){
          simsim_df <- cbind(simsim_df, simsim[[i]][[1]])
    }else{
          simsim_df <- cbind(simsim_df, rep(0,hnum))    
    }
    
}


## ----------------------------------------------------
allf = simsim_df


## ----------------------------------------------------
colnames(allf)  <-   colnames(allts)  


## ----------------------------------------------------
allf[allf<0] = 0


## ----------------------------------------------------
write.csv(allf,'BSTS-fore-GTS-1.csv')


## ----------------------------------------------------
allf<-read.csv('BSTS-fore-GTS-1.csv',row.names=1)


## ----------------------------------------------------
# combine the forecasts with the group matrix to get a gts object
g <- get_groups(gts_train)
y.f <- combinef(allf, groups = g)


## ----------------------------------------------------
forecasts_7 = y.f[[1]]


## ----------------------------------------------------
colnames(forecasts_7) = colnames(y[[1]])


## ----------------------------------------------------
data_f5 = rbind(gts_train[[1]], forecasts_7)


## ----------------------------------------------------
y_f5 = gts(data_f5, characters = list(c(7), c(1,4)), 
           gnames = c("Отпр","ЭИ","Наз","Отпр-ЭИ"))

plot(y_f5, levels = c(0, 1, 2,3,4,5))


## ----------------------------------------------------
plot(y, level=2)
plot(y_f5, level=2)


## ----------------------------------------------------
gts_forecasts_7  <- window(y_f5, start=(105-9+1), end=105)

tab = accuracy.gts(gts_forecasts_7, gts_test)

tab



## ----------------------------------------------------
bsts_hts <- data.frame(u1=tab[1:3,cumsum(nnumb)[1]],
u2=rowSums(tab[1:3,(cumsum(nnumb)[1]+1):cumsum(nnumb)[2]]),
u3=rowSums(tab[1:3,(cumsum(nnumb)[2]+1):cumsum(nnumb)[3]]),
u4=rowSums(tab[1:3,(cumsum(nnumb)[3]+1):cumsum(nnumb)[4]]),
u5=rowSums(tab[1:3,(cumsum(nnumb)[4]+1):cumsum(nnumb)[5]]),
u6=rowSums(tab[1:3,(cumsum(nnumb)[5]+1):cumsum(nnumb)[6]])                   )
rw_hts
th_hts
bsts_hts


## ----------------------------------------------------
all_hts_tab<-data.frame(rw_hts[,1],
th_hts[,1],
bsts_hts[,1],
rw_hts[,2],
th_hts[,2],
bsts_hts[,2],
rw_hts[,3],
th_hts[,3],
bsts_hts[,3],
rw_hts[,4],
th_hts[,4],
bsts_hts[,4],
rw_hts[,5],
th_hts[,5],
bsts_hts[,5],
rw_hts[,6],
th_hts[,6],
bsts_hts[,6])

row.names(all_hts_tab)<-row.names(bsts_hts)

round(all_hts_tab/1000000,3)
write.csv(round(all_hts_tab/1000000,3),"all_gts_tab-1.csv")


## ----------------------------------------------------
rosst <- read.csv('Pogruzka_04-2023_rosstat.csv',row.names = 1)


## ----------------------------------------------------
probs_df <- read.csv("BSTS-fore-prop-GTS-1.csv", row.names = 1)


## ----------------------------------------------------
rossat_true_forecasts = probs_df * rosst[97:133,'УГ']*1000


## ----------------------------------------------------
colnames(rossat_true_forecasts) = colnames(allts)


## ----------------------------------------------------
diffs <- (allf_ros/data.frame(rossat_true_forecasts))


## ----------------------------------------------------
diffs <- diffs %>% mutate_all(~ifelse(is.na(.x), mean(.x, na.rm = TRUE), .x))       


## ----------------------------------------------------
for(i in 1:ncol(diffs)){
  diffs[is.infinite(diffs[,i]), i] <- mean(diffs[is.finite(diffs[,i]),i], na.rm = TRUE)
}



## ----------------------------------------------------
dif_year <- diffs[,(cumsum(nnumb)[2]+1):cumsum(nnumb)[3]]
colnames(dif_year)<-sub('ЭИ.', '', colnames(dif_year))


## ----------------------------------------------------
tv <- rossat_true_forecasts_fact[,(cumsum(nnumb)[2]+1):cumsum(nnumb)[3]]
vol_choice <- colSums(tv)/sum(colSums(tv))
vol_choice


## ----------------------------------------------------
dif_year <- data.frame(colMeans(dif_year[1:12,], na.rm = TRUE), #2020
colMeans(dif_year[13:24,], na.rm = TRUE), #2021
colMeans(dif_year[25:36,], na.rm = TRUE)) #2022


colnames(dif_year) <- c(2020,2021,2022)
vn = (dif_year-1)*100
colnames(vn) = c('d2020','d2021','d2022')
vn


## ----------------------------------------------------
dif_year <- diffs[,(cumsum(nnumb)[3]+1):cumsum(nnumb)[4]]
dif_year<-dif_year[,1:16]
dif_year<-dif_year[25:36,]
select_ve<- substr(colnames(dif_year),5,5)

colnames(dif_year)<-sub('Наз.В', '', colnames(dif_year))
colnames(dif_year)<-sub('Наз.Э', '', colnames(dif_year))


## ----------------------------------------------------
# dif_year


## ----------------------------------------------------
vnutr <- dif_year[,(select_ve=='В')]
exp <- dif_year[,(select_ve!='В')]


## ----------------------------------------------------
# vnutr


## ----------------------------------------------------
# exp


## ----------------------------------------------------
vn<-(colMeans(vnutr)-1)*100

vn=data.frame(values=vn)

vn['reg']=rownames(vn)

vn = vn[order(vn[['values']]),]

vn


## ----------------------------------------------------
vn[vn['values']>100,'values'] = 75
options(repr.plot.width=3, repr.plot.height=4)
ggplot(data=vn, aes(y=values,x=reg)) +
  geom_bar(stat='identity') + 
  ylab('ПИ') +
  xlab('ФО РФ') +
  coord_flip() 


## ----------------------------------------------------
vn<-(colMeans(exp)-1)*100

vn=data.frame(values=vn)

vn['reg']=rownames(vn)

vn = vn[order(vn[['values']]),]

vn


## ----------------------------------------------------
options(repr.plot.width=3, repr.plot.height=4)
ggplot(data=vn, aes(y=values,x=reg)) +
  geom_bar(stat='identity') + 
  ylab('ПИ') +
  xlab('ФО РФ') +
  coord_flip() 


## ----------------------------------------------------
dif_year <- diffs[,(cumsum(nnumb)[1]+1):cumsum(nnumb)[2]]
dif_year <- dif_year[25:36,]


## ----------------------------------------------------
colnames(dif_year)<-sub('Отпр.', '', colnames(dif_year))


## ----------------------------------------------------
vn= data.frame(values=colMeans((dif_year-1)*100), reg=names(dif_year))


## ----------------------------------------------------
true_vol <- data.frame(rossat_true_forecasts)[,(cumsum(nnumb)[1]+1):cumsum(nnumb)[2]]
colnames(true_vol)<-sub('Отпр.', '', colnames(true_vol))


## ----------------------------------------------------
vol_choice <- colSums(true_vol)/sum(colSums(true_vol))
vol_choice <- vol_choice[vol_choice>0.005]


## ----------------------------------------------------
vol_choice


## ----------------------------------------------------
vn = vn[names(vol_choice),]
vn=vn[order(vn[['values']]),]


## ----------------------------------------------------
dat_hex = st_read('8_russia_hex.gpkg')


## ----------------------------------------------------
regz_namz <- read.csv('8_dat_hex.csv')


## ----------------------------------------------------
dat_hex[['name_short']]<-regz_namz[['name_short']]


## ----------------------------------------------------
vn[vn['values']>100,'values']=100

dat_hex=merge(dat_hex,vn,by.x='name_short', by.y = 'reg', all.x=TRUE,all.y=TRUE)

x <- c()
y <- c()
x_mean <- c()
y_mean <- c()

 
for (i in 1:dim(dat_hex)[1]){
    x <- c(x,dat_hex[[i,'geometry']][[1]][,1])
    x_mean <- c(x_mean,mean(dat_hex[[i,'geometry']][[1]][1:6,1]))
    y <- c(y,dat_hex[[i,'geometry']][[1]][,2])
    y_mean <- c(y_mean,mean(dat_hex[[i,'geometry']][[1]][1:6,2]))
}

ids <- factor(dat_hex[['name']])

values <- data.frame(
  id = ids,
  value = dat_hex[['values']]
)

positions <- data.frame(
  id = rep(ids, each = 7),
  x = x,
  y = y
)

# centers <- cbind.data.frame(x=dat_hex[['x_mean']],y=dat_hex[['y_mean']], id=dat_hex[['reg']])
centers <- cbind.data.frame(x=x_mean,y=y_mean, id=dat_hex[['reg']])
 


## ----------------------------------------------------
# Currently we need to manually merge the two together
datapoly <- merge(values, positions, by = c("id"))

options(repr.plot.width=10, repr.plot.height=5)
p <- ggplot(datapoly, aes(x = x, y = y)) +
  geom_polygon(aes(fill = value, group = id)) +theme_void()+ 
# theme(aspect.ratio=4/7)+
  scale_fill_continuous(name = "%")+
  geom_text(data=centers, aes(x=x, y=y, label=id), color='white') 
p


## ----------------------------------------------------
dif_year <- diffs[,(cumsum(nnumb)[5]+1):cumsum(nnumb)[6]]


## ----------------------------------------------------
dif_year <- data.frame(colMeans(dif_year[1:12,], na.rm = TRUE), #2020
colMeans(dif_year[13:24,], na.rm = TRUE), #2021
colMeans(dif_year[25:36,], na.rm = TRUE)) #2022


colnames(dif_year) <- c(2020,2021,2022)
vn = (dif_year-1)*100
colnames(vn) = c('d2020','d2021','d2022')


## ----------------------------------------------------
true_vol <- data.frame(rossat_true_forecasts)[,(cumsum(nnumb)[5]+1):cumsum(nnumb)[6]]


## ----------------------------------------------------
vol_choice <- colSums(true_vol)/sum(colSums(true_vol))
vol_choice <- vol_choice[vol_choice>0.01]

vol_choice[order(vol_choice)]


## ----------------------------------------------------
vn = vn[names(vol_choice),]
vn=vn[order(vol_choice),]
vn['Доля в общем объеме'] = vol_choice[order(vol_choice)]
write.csv(round(vn,2),'marsh-1.csv')
round(vn,2)

