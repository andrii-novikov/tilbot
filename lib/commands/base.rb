module Commands
  class Base
    include Interactor

    def send_message(text:, chat_id: context.message.chat.id, parse_mode: 'MarkdownV2')
      context.bot.api.send_message(chat_id: chat_id, text: text, parse_mode: parse_mode)
    end
  end
end
