class Api::V1::ApiGestorController < ApplicationapiController
  #acts_as_token_authentication_handler_for User
  #before_action :require_authentication!
  #after_action :request_log

  def can_access?(args)
    if ((request.format == :json) && current_user.tem_acesso_ao_setor(args)) || current_user.acessa_funcionalidade(args[:funcionalidade], args[:acao])
      if args[:error].present?
        render json: args[:error], status: :bad_request
      else
        yield
      end
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end
end
