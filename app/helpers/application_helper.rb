module ApplicationHelper

  def create_link(message)
    link_object  = message.description.match(/>>[0-9]+/).to_s
    link_to(
      link_object,
      "##{message.parent_message_id}"
    )
  end

  def create_description_expect_link(message)
    message.description.sub(/>>[0-9]+/,"")
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
