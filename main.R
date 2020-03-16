## libraries
library(dplyr)
library(rtweet)

## call my token script to interact with twitter
source("~/R/tweetr/env.r")

## get my feed
feed <- get_my_timeline(n = 1e10)

## clean data to only get media related tweets
funny_photos <- 
  feed %>% 
    filter(media_type == 'photo') %>% 
    filter(favorite_count > 999) %>% 
    mutate(status_id = as.character(status_id)) %>% 
    select(status_id)

## retweet the funny pictures!
for(i in 1:nrow(funny_photos)) {
  post_tweet(retweet_id = funny_photos$status_id[[i]])
}
