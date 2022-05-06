module Commands
  class Base
    def initialize(bot, chat_id)
      @bot = bot
      @chat_id = chat_id
    end

    private

    def send_message(text:, chat_id: @chat_id, parse_mode: 'MarkdownV2')
      @bot.api.send_message(chat_id: chat_id, text: text, parse_mode: parse_mode)
    end
  end
end
