# Secrets
consumer_key <- Sys.getenv("CONSUMER_KEY")
consumer_secret <- Sys.getenv("CONSUMER_SECRET")
access_token <- Sys.getenv("ACCESS_TOKEN")
access_secret <- Sys.getenv("ACCESS_SECRET")

token <- create_token(
  app = "reids_tweetr",
  consumer_key = consumer_key,
  consumer_secret = consumer_secret, 
  access_token = access_token, 
  access_secret = access_secret
)

rm(consumer_key, consumer_secret, access_token, access_secret)
