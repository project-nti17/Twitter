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

api_key <-"hEBaiP972AtwRx58reuyre8xj"

api_secret <-"M5ZBavmq9tyfqDjahS47pE51Wg7lljDcPHl2mT3N2iYhSdmZqi"

access_token <-"4826523381-qT34Qbavqt0bkELfdbm8YvXuBtDQsuqil6GVVAC"

Access_token_Secret	<-"WqayttsXXpj5Pbr364nNYKCiP2vltaJnpPGoc3Azkbndp"

setup_twitter_oauth(api_key,api_secret,access_token,Access_token_Secret)

#----------create data frames-------

# Create a data frame that relates friends and followers to you for expression in the graph

relations <- merge(data.frame(User='geoffjentry', Follower=friends), 
                   data.frame(User=followers, Follower='geoffjentry'), all=n)

