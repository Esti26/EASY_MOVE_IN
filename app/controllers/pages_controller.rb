class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
      @moves = Move.all
  end

  def new

  end

  def create

  end

  def log_in
    @user = User.find(:email, :password)
  end
end
