module Commands
  class Random < Base
    def call
      feed = Feed::Store.instance

      send_message(text: feed.all.sample.to_message)
    end
  end
end
