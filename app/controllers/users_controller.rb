
# Simple service to serve up fake users to test Movie Queue Services
class UsersController < ApplicationController
  rescue_from StandardError, with: :return_service_error

  def index
    users = User.limit(200).order('last_login desc').select('id,fname,lname,last_login')
    render json: users, status: 200
  end

  def show
    user = User.where(['id = ?', params[:id]]).select('id,fname,lname,last_login').first
    if user.nil?
      render json: { message: 'user not found' }, status: :not_found
    else
      render json: user.to_json, status: 200
    end
  end


  private

  def return_service_error(error)
    print error.backtrace.join("\n")
    render json: { message: error.message }, status: :internal_server_error
  end

end

