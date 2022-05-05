# frozen_string_literal: true

module Commands
  class Help < Base
    TEXT = <<~MESSAGE
      *My commands:*

      `/all` \\- get all rss items
      `/last` \\- get last rss item
      `/random` \\- get random item from all rss
      `/help` \\- show this hint
    MESSAGE

    def call
      send_message(text: TEXT)
    end
  end
end
