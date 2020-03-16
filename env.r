# Secrets
key <- Sys.getenv("CONSUMER_KEY")
secret <- Sys.getenv("CONSUMER_SECRET")

token <- create_token(
  app = "reids_tweetr",
  consumer_key = key,
  consumer_secret = secret
)

rm(key, secret)
