class ErrorsController < ApplicationController
    before_action :render_em_branco
    layout "errors"

    def render_em_branco
        if !["html", "js", "json"].include?(request.format.symbol.to_s)
            render nothing: true, layout: false
        end 
    end

    def not_found
        render_status_code(404)
    end

    def internal_server_error
        # render "500"
        render_status_code(500)
    end

    def unprocessable
        # render "422"
        render_status_code(422)
    end

    def unacceptable
        render_status_code(403)
    end


    # Erro retornado na impressão do mordomo, não tem status code
    def mordomo_error
        
    end


private

    def render_status_code(code)
        msg_js = case code
                 when 500
                     "Desculpe, Ocorreu um problema!"
                 when 422
                     "A alteração que você tentou fazer foi rejeitada. Talvez você tenha tentado mudar algo sem ter acesso."
                 when 403
                     "Você não tem permissão para completar a ação."
                 when 404
                     "A página que você está tentando acessar não foi encontrada."
                 else
                     ""
                 end
        respond_to do |format|
            format.html { render status: code }
            format.js   { render js: "alert('#{msg_js} (status: #{code.to_s})');" }
        end    
    end
end
