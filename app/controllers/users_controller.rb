class UsersController < ApplicationController

  def index
    @users = User.limit(200).order('last_login desc').select('id,fname,lname,last_login')
    render json: @users, status: 200
  end

end

