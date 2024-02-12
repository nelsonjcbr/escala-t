class ApplicationController < ActionController::Base
    before_action :authenticate_user!, if: :error_controller?
    before_action :set_paper_trail_whodunnit
    before_action :configure_permitted_parameters, if: :devise_controller?

    def download_arquivo_mordomo(impressao, nome_arquivo_destino)
        if impressao.try(:class) == ActiveModel::Errors
            render template: 'errors/mordomo_error',
                   layout: "errors",
                   locals: {erro: impressao.full_messages.join("</br>").force_encoding('UTF-8').html_safe }
        else
            send_data File.read(impressao), :disposition => 'inline', :filename => nome_arquivo_destino.to_s, :content_type => "application/pdf" 
        end    
    end

    rescue_from CanCan::AccessDenied do |exception|
        flash[:error] = exception.message
        respond_to do |format|
            format.json { render nothing: true, status: 403 }
            format.html { redirect_to url_for({controller: "errors",action: "unacceptable", format: :html })}
            format.js   { render js: "alert('#{exception.message}');" }
        end
    end
    
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:nome])
        devise_parameter_sanitizer.permit(:account_update, keys: [:nome])
    end

    def error_controller?
        controller_name != "errors"
    end
end
