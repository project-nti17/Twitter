
                     #-----social network analysis----
                    #------twitter data mining--------

library(twitteR)

library(RCurl)

library(ROAuth)

library(igraph)


api_key <-"hEBaiP972AtwRx58reuyre8xj"

api_secret <-"M5ZBavmq9tyfqDjahS47pE51Wg7lljDcPHl2mT3N2iYhSdmZqi"

access_token <-"4826523381-qT34Qbavqt0bkELfdbm8YvXuBtDQsuqil6GVVAC"

Access_token_Secret	<-"WqayttsXXpj5Pbr364nNYKCiP2vltaJnpPGoc3Azkbndp"

setup_twitter_oauth(api_key,api_secret,access_token,Access_token_Secret)

            #--------extract tweets--------

   #searchTwitter function can be used to search for tweets that match a desired term

tweets<-searchTwitter("Donald Trump",n=10)
tweets

           #-----------Timelines-----------

   #To look at a particular user's timeline that user must either have a public account or you must have access to their account

geo_tweets<-userTimeline('geoffjentry')
geo_tweets[1:5]
geo_tweets_large<-userTimeline('geoffjentry', n=10)
length(geo_tweets_large)

           #-----------Trends---------

  #The getTrends function is used to pull current trend information from a given location,

avail_trends=availableTrendLocations()
head(avail_trends)
close_trends=closestTrendLocations(-4,-7)
head(close_trends)
trends=getTrends(2367105)
head(trends)


         #--------showStatus---------

 #These functions can be used to retrieve specific tweets from the server

showStatus(889874421892206592)

            #---------Looking at users------

   #The getUser function returns a user object, which can then be polled for further information.

start<-getUser("geoffjentry") 

          #----------  friends and followers --------

   #Get Friends and Follower names with first fetching IDs
           
friends.object<-lookupUsers(start$getFriendIDs())
follower.object<-lookupUsers(start$getFollowerIDs())

   # Retrieve the names of your friends and followers from the friend
   # size of the selected data with [1:n], where n is the number of followers/friends 

n<-5
friends <- sapply(friends.object[1:n],name)
followers <- sapply(follower.object[1:n],name)


           #----------create data frames-------

   # Create a data frame that relates friends and followers to you for expression in the graph

relations <- merge(data.frame(User='geoffjentry', Follower=friends), 
                   data.frame(User=followers, Follower='geoffjentry'), all=n)

           #----------graph---------------

   # Create graph from relations.

g <- graph.data.frame(relations, directed = n)

          #----------label-----------------

# Assign labels to the graph (=people's names)

V(g)$label <- V(g)$name

          #---------- Plot the graph------

plot.igraph(g)



