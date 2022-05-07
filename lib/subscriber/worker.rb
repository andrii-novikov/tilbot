module Subscriber
  class Worker
    def initialize(tg_token)
      @feed = Feed::Store.new
      @subscribers = Model::Subscriber.all
      @bot = Telegram::Bot::Client.new(tg_token)
    end

    def call
      @subscribers.each do |subscriber|
        posts = new_posts(subscriber.last_post_date)

        next if posts.empty?

        text = if posts.one?
                 "Hello\\! Here is a new post\\!\n\n#{posts[0].to_message}"
               else
                 "Hello'\\! Here is a new posts\\!\n\n#{Messages::Posts.new(posts)}"
               end

        @bot.api.send_message(chat_id: subscriber.chat_id, text: text, parse_mode: 'MarkdownV2')

        subscriber.update_attributes(last_post_date: posts[0].pubDate)
      end
    end

    private

    def new_posts(last_date)
      return [@feed.all.first] unless last_date

      @feed.all.select do |post|
        post.pubDate > last_date
      end
    end
  end
end
