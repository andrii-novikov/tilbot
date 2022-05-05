module Commands
  class All < Base
    def call
      feed = Feed::Store.instance

      text = feed.all.map.with_index do |post, i|
        "#{i.next}\\. #{post.to_message}"
      end.join("\n")

      send_message(text: text)
    end
  end
end
