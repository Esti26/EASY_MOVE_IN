class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @moves = Move.all
    @move = Move.new()
  end

  def log_in
    @user = User.find(:email, :password)
    # if Company.find(user_id: current_user.id)
      # redirect_to company_path
    # else
    redirect_to client_path if log_in
    # end
  end
end
