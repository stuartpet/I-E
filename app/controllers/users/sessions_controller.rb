# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  include RackSessionsFix

  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render json: { message: 'Logged in successfully.', user: resource }, status: :ok
  end

  def respond_to_on_destroy
    if request.headers['Authorization'].present?
      jwt_payload = JWT.decode(request.headers['Authorization'].split(' ').last,
                               Rails.application.credentials.jwt_secret_key).first
      current_user = User.find(jwt_payload['sub'])
    end

    if current_user
      render json: { message: 'Logged out successfully.' }, status: :ok
    else
      render json: { message: 'Could not log out.' }, status: :unauthorized
    end
  end
end
