class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @moves = Move.all
    @move = Move.new()
  end

  def log_in
    @user = User.find(:email, :password)
  end
end
