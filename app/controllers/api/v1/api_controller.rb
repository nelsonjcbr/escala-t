module Api::V1
  class ApiController < ApplicationapiController
    #acts_as_token_authentication_handler_for User
    before_action :require_authentication!
    after_action :request_log
    #layout false
    def authorize!(args)
      if (request.format == :json) && current_user.acessa_funcionalidade(args[:funcionalidade], args[:acao])
        if args[:error].present?
          render json: args[:error], status: :bad_request
        elsif args[:each_serializer].present? || args[:root].present?
          render json: yield, each_serializer: args[:each_serializer].try(:constantize),
                              root: args[:root],
                              scope: { quarto_id: args[:quarto_id], leito_id: args[:leito_id] },
                              data: args[:data],
                              include: "**"
        elsif args[:adapter].present?
          yield
        elsif args[:include].present?
          render json: yield, include: "**"  # multiples has_many
        else
          render json: yield
        end
      else
        render json: { error: "Forbidden" }, status: :forbidden
      end
    end
  end
end
