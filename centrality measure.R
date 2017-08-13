#using R Studio
install.packages("Rtwitter" ,  repos="https://cran.rstudio.com/")
install.packages("RoAuth" , repos="https://cran.rstudio.com/")
install.packages("RCurl" , repos="https://cran.rstudio.com/")
install.packages("httr" , repos="https://cran.rstudio.com/")
install.packages("igraph" , repos="https://cran.rstudio.com/" )

library(twitteR)

library(RCurl)

library(ROAuth)

library(igraph)

library(ggplot2)

api_key <-"hEBaiP972AtwRx58reuyre8xj"

api_secret <-"M5ZBavmq9tyfqDjahS47pE51Wg7lljDcPHl2mT3N2iYhSdmZqi"

access_token <-"4826523381-qT34Qbavqt0bkELfdbm8YvXuBtDQsuqil6GVVAC"

Access_token_Secret	<-"WqayttsXXpj5Pbr364nNYKCiP2vltaJnpPGoc3Azkbndp"

setup_twitter_oauth(api_key,api_secret,access_token,Access_token_Secret)

#-----------centrality measure---------

#degree: number of connections
#betweennes: number of shortest paths an actor is on
#closeness: relative distance to all other users
#eignvector:leading eignvector centrality

metrics<-data.frame(
  deg=degree(igraph),
  bet=betweenness(igraph),
  clo=closeness(igraph),
  eig=evcent(igraph)$vector,
  cor=graph.coreness(igraph)
)


ggplot(
  metrics,
  aes(x=bet , y=deg ,
      label = rownames(metrics),
      
      colour="red" )
)+
  xlab("Betweenness Centrality")+
  ylab("degree Centrality")+
  geom_text()


