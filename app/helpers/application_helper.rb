module ApplicationHelper

  def add_link_to_description(message)
    safe_message = message.description.gsub(/<.+on[a-w]+=.+>/,"不正な入力です")
    link_mark = safe_message.match(/>>[0-9]+/).to_s
    created_link = link_to(link_mark, "##{message.parent_message_id}")
    safe_message.sub(/>>[0-9]+/, created_link )
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
