remove(list=ls())
library(fpp3)
temp = readr::read_csv('Pet.csv')
pet = temp%>%mutate(DATE=yearmonth(mdy(DATE)))%>%
  as_tsibble(index=DATE)

pet%>%autoplot()

petTRAIN = pet%>%filter_index('1985 Sep'~'2022 April')

modelNAIVE = petTRAIN%>%model(NAIVE(WPU029402))
foreNAIVE = modelNAIVE%>%forecast(h=6)
#305 is the .mean
foreNAIVE%>%autoplot(filter_index(pet,'2019 Jan'~'2022 Oct')) #ask chandu to fix the gap

#applying the log transformation
petTRAIN%>%autoplot(log(WPU029402))+ylab('Logarithmic Transformation')
#checking for seasonality 
petTRAIN%>%gg_season(log(WPU029402))

#looks like we dont need to perform a box cox but lets see how this works out
lambdaPET = petTRAIN%>%features(WPU029402,guerrero)%>%
  pull(lambda_guerrero)
lambdaPET
petTRAIN%>%autoplot(box_cox(WPU029402,lambdaPET))+
  ylab('Box Cox Transformation')

#the graph doesnt provide much difference than the log transformed data but lets see

#performing STL decomposition for a periodic season and all observations of trend considered
petTRAIN%>%model(STL(WPU029402~season(window='periodic')+trend(window=440)))%>%
  components()%>%autoplot()

#STL for 7 years and 13 quaters
petTRAIN%>%model(STL(WPU029402~season(window=7)+trend(window=13)))%>%
  components()%>%autoplot()
#we can see linear growth in trend and non linearity can be handled through log transformation
#possibility of changing seasonal variation


#ETS model
fit=petTRAIN%>%model(ETS(WPU029402~error("A")+trend("A")+season("N")))
report(fit)
foreETS=fit%>%forecast(h=6)
foreETS$.mean

#forecasting the ets
foreETS%>%autoplot(filter_index(pet,"2018 Jan "~"2022 Oct"))

#we can see that the model is better than the modelNaive but we still need a better 
#forecasting technique


#comparing the 2 momdels done so far
#can save it for ppt but lets see
mableTRAIN=petTRAIN%>%model(modelNAIVE=NAIVE(WPU029402),
                                  MAM=ETS(log(WPU029402)~error("A")+trend("A")+season("N")))
forecasts=mableTRAIN%>%forecast(h=6)
forecasts%>%autoplot(filter_index(pet,"2018 Jan"~"2022 Oct"),level=NULL)


