module Commands
  class Unsubscribe < Base
    def call
      #TODO: i18n
      subscriber = Model::Subscriber.where(chat_id: @chat_id).first
      return send_message(text: 'You are not subscribed') if subscriber.blank?

      if subscriber.destroy
        send_message(text: 'You are successfully unsubscribed')
      else
        send_message(text: 'Something went wrong')
      end
    end
  end
end
