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

#Get Follower names with first fetching IDs

follower.object<-lookupUsers(start$getFollowerIDs())

# Retrieve the names of your followers from the friend
# size of the selected data with [1:n], where n is the number of followers

n<-5
friends <- sapply(friends.object[1:n],name)
