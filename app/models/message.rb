class Message < ApplicationRecord
  validates :description, presence: true
  before_save :custom_create
  has_many :messages, class_name: "Message",
                         foreign_key: "parent_message_id"

  belongs_to :parent_message, class_name: "Message", optional: true
  belongs_to :hub

  def custom_create
    self.user = "名無しさん" if self.user == ""
    self.parent_message_id = grep_parent_id(self.description, self.hub_id)

    return if self.hub_index != nil
    self.hub_index = Message.where(hub_id: self.hub_id).count + 1
  end

  private
  def  grep_parent_id(message_description, hub_id)
    if message_description.include?(">>")
      Message.find_by(
        hub_index: hub_index = message_description.match(/>>[0-9]+/).to_s.sub(/>>/,"").to_i,
        hub_id: hub_id
      )&.id
      # 例えば親メッセージのhub_index: 2として
      # そのメッセージが削除されたとする
      # そのとき>>2で返信をするメッセージをupdateするとき
      # hub_index:2は存在しないので、Message.find_byはnil
      # となりエラーをはく
      # これを防ぐためにレシーバがnilのときに.idの結果がnilとならないように
      # ぼっち演算子を使用
    end
  end
end
