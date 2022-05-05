module Feed
  class Store
    URL = 'https://til.hashrocket.com/rss'
    REFRESH_INTERVAL = 1 * 60 * 60

    def self.instance
      @instance ||= new
    end

    def initialize
      load_feed
    end

    def all
      load_feed if Time.now > @updated_at + REFRESH_INTERVAL

      @feed
    end

    private

    def load_feed
      response = Net::HTTP.get(URI(URL))
      feed = RSS::Parser.parse(response)
      feed.items.map { |i| ItemDecorator.new(i) }

      @updated_at = Time.now
      @feed = feed.items.map { |i| ItemDecorator.new(i) }
    end
  end
end
