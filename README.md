# TilBot

Bot allows you get posts from [Today I Learned](https://til.hashrocket.com/) site from HashRocket

# Run

Ensure that you have next env variables:
* TELEGRAM_BOT_TOKEN - telegram bot token

Create tables:
```shell
rake dynamoid:create_tables
```

And run:
```shell
bin/server
```

# Subscription

To send new posts to subsribers run

```shell
bin/subscriber
```
