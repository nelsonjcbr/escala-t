class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protect_from_forgery

  before_action :authenticate_user!
  
  #rescue_from CanCan::AccessDenied do |exception|
  #  redirect_to '/', :alert => exception.message
  #end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:        [:name, :nome_chamado, :cpf, :email, :password, :sexo, :conselhoclass_id, :numero_conselho, :uf_conselho_id, :profissao])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :nome_chamado, :cpf, :email, :password, :current_password, :sexo, :conselhoclass_id, :numero_conselho, :uf_conselho_id, :profissao])
#    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :nome_completo, :cpf, :email, :password, :current_password) }
#    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, address_attributes: [:country, :state, :city, :area, :postal_code]])
  end
end
