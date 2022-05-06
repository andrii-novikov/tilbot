module Bot
  class Poller
    class InvalidToken < StandardError; end

    def initialize(token)
      @token = token
      @bot = Telegram::Bot::Client.new(@token)
    end

    def run
      @bot.listen { handle_new_message(_1) }
    rescue Telegram::Bot::Exceptions::ResponseError
      raise InvalidToken, 'Please provide a valid telegram bot token'
    end

    private

    def handle_new_message(message)
      command = find_command(message.text) || Commands::Help
      command.new(@bot, message.chat.id).call
    rescue StandardError => e
      warn "Failed to handle message: #{e.message}"
    end

    def find_command(msg)
      command = msg[1..].capitalize

      return unless Commands.const_defined?(command)

      Commands.const_get(command)
    end
  end
end
