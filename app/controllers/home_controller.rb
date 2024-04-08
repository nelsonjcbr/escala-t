class HomeController < ApplicationController
  
  def index
    if current_user.admin? then
    end
    if current_user.organizer? then
    end
    if current_user.user? then
      plantoes = PlantoesUserService.new(user_id: current_user.id)
      @plantao_para_check_in  = plantoes.plantoes_para_check_in.first
      @plantao_para_check_out = plantoes.plantao_para_check_out.first
      @ultimos_plantoes = plantoes.ultimos_plantoes
      @proximos_plantoes = plantoes.proximos_plantoes      
    end
  end
end
