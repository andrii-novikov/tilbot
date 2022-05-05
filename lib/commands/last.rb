module Commands
  class Last < Base
    def call
      feed = Feed::Store.instance
      post = feed.all.first

      send_message(text: post.to_message)
    end
  end
end
