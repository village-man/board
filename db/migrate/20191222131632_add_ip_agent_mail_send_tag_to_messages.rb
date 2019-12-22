class AddIpAgentMailSendTagToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :client_ip, :string
    add_column :messages, :agent, :string
    add_column :messages, :mail_tag, :boolean, defalut: nil
  end
end
