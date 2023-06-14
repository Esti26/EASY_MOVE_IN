class ApplicationController < ActionController::Base
  before_action :authenticate_user!
end
  # def after_sign_in_path_for(resource_or_scope)
  #   if Client.find_by(user_id: current_user.id)
  #     client_path
  #   else
  #     company_path
  #   end
  # end
