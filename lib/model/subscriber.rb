module Model
  class Subscriber
    include Dynamoid::Document

    field :chat_id, :string
    field :last_post_date, :datetime

    global_secondary_index hash_key: :chat_id, projected_attributes: :all
  end
end
