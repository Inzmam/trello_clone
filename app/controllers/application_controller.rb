class ApplicationController < ActionController::Base
  before_action :authenticate_request
  skip_before_action :verify_authenticity_token
  attr_reader :api_user

  private

  def authenticate_request
    @api_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @api_user
  end
end
