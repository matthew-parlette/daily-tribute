class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  private

    def user
      @user = user_signed_in? ? current_user : nil
      puts @user
    end
end
