class Api::V1::UsersController < ApplicationController

  skip_before_action :authenticate_request

  def create
    @api_user = User.new(user_params)

    if @api_user.save
      render json: {
        auth_token: AuthenticateUser.call(@api_user.email, @api_user.password).result,
        user: @api_user,
        success: 'User was successfully created.'
      } 
    else
      render json: { errors: @api_user.errors } 
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
