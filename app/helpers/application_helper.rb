module ApplicationHelper

  def add_link_to_description(message)
    message_except_script = message.description.gsub(/<script.*[\s\S]*\/script>/,"")
    link_mark = message_except_script.match(/>>[0-9]+/).to_s
    created_link = link_to(link_mark, "#{message.parent_message_id}")
    message_except_script.sub(/>>[0-9]+/, created_link )
  end

  def create_select_box
    select_array = []
    @boards.each do |board|
      select_array << [ board.name, board.id ]
    end
    select_array
  end
  
  def user_admin?
    current_user.try(:admin_flag?)
  end


end
