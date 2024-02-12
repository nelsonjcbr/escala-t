class ApplicationapiController < ActionController::API
  
  #layout false 

  private

  def require_authentication!
    throw(:warden, scope: :user) unless current_user.presence
  end

  def request_log
    ApiLog.create(
      user_id: current_user.id,
      endpoint: request.path,
      parametros: request.query_parameters.to_json,
      codigo_erro: response.status == 200 ? nil : response.status
    ) if current_user.presence
  end
end
