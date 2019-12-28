class UsersController < ApplicationController
  def show
    @token = current_user.reset_password_token
  end
end
