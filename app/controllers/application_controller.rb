class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :logged_in_user, only: [:show]

  private

  def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインしてください"
      redirect_to root_url
    end
  end

end
