class Api::UsersController < ApplicationapiController
  respond_to :json

  # POST /api/users_login
  def login
    @user = User.find_by_email params[:email]
    if @user.present? && @user.valid_password?(params[:password])
      @user.generate_token
      render json: { token: @user.authentication_token}, status: :ok
    else
      render json: { status: "Usuário ou senha inválidos"}, status: :unauthorized
    end
  end

  # POST /api/users_logout
  def logout
    @user = User.find_by_email(request.headers["X-User-email"])
    if @user.present?
      if @user.authentication_token.present? && @user.authentication_token == request.headers["X-User-token"]
        @user.destroy_token
        render status: :ok
      else
        render json: {error: "Logout não autorizado, token informado do usuário não foi localizado"}, status: :unauthorized
      end
    else
      render json: {error: "Logout não autorizado, e-mail do usuário não foi localizado"}, status: :unauthorized
    end
  end
end
