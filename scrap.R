library(tidyverse)
library(scholar)
library(httr)
library(data.table)


set_config(use_proxy(url = '127.0.0.1',port=7890))
GET('www.google.com')


example<-scholar::get_profile("hE45t4cAAAAJ")
scholar::get_scholar_id('Zhifu','Mi')

af<-c('Zhifu','Linda')
al<-c('Mi','Steg')
sid<-c()

for (i in 1:2) {
  tempid<-get_scholar_id(af[i],al[i])
  sid[i]<-c(tempid)
  print(sid)
}

name<-rep(0,2)
inst<-rep(0,2)
homepage<-rep(0,2)
interest<-rep(0,2)
hindex<-rep(0,2)
for (i in 1:2){
  example<-get_profile(sid[i])
  name[i]<-example$name
  inst[i]<-example$affiliation
  interest[i]<-example$interests[i]
  hindex[i]<-example$h_index
  homepage[i]<-example$homepage
}