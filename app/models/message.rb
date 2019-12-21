class Message < ApplicationRecord
  # validates :user, message_user_check:true

  has_many :messages, class_name: "Message",
                         foreign_key: "parent_message_id"

  belongs_to :parent_message, class_name: "Message", optional: true
  belongs_to :hub
end
