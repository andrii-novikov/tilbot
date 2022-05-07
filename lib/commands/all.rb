module Commands
  class All < Base
    def call
      feed = Feed::Store.instance

      send_message(text: Messages::Posts.new(feed.all))
    end
  end
end
