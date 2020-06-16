class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :error

  # コントローラのメソッドを、ヘルパーとしてビューでも利用可能にする
  helper_method :current_user

  before_action :login_required

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def login_required
    redirect_to login_path unless current_user
  end

  if Rails.env.production?
    rescue_from Exception, with: :error500
    rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError, with: :error404
  end

  def error404(_e)
    render 'error404', status: 404, formats: [:html]
  end

  def error500(_e)
    render 'error500', status: 500, formats: [:html]
  end
end
