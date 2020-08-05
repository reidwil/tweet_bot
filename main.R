## libraries
library(dplyr)
library(rtweet)

## call my token script to interact with twitter
source("env.r")

## get my feed
feed <- get_my_timeline(n = 1e10)

## clean data to get 
## 1. media related tweets with 1k+ favorites
## 2. text related tweets with 10k+ favorites

funny_photos <- 
  feed %>% 
    filter(media_type == 'photo') %>% 
    filter(favorite_count > 999) %>% 
    mutate(status_id = as.character(status_id)) %>% 
    select(status_id)

funny_tweets <-
  feed %>% 
    filter(is.na(media_type)) %>% 
    filter(favorite_count > 9999) %>% 
    mutate(status_id = as.character(status_id)) %>% 
    select(status_id)

tweets <- rbind(funny_photos, funny_tweets)

## retweet the funny stuff!
for(i in 1:nrow(tweets)) {
  post_tweet(retweet_id = tweets$status_id[[i]])
}
