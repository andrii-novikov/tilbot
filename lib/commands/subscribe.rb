module Commands
  class Subscribe < Base
    def call
      #TODO: i18n
      return send_message(text: 'You are already subscribed') if Model::Subscriber.exists?(chat_id: @chat_id)

      Model::Subscriber.create(chat_id: @chat_id, last_post_date: Time.now)
      send_message(text: 'You are successfully subscribed')
    end
  end
end
