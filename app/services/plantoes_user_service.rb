# Tudo com relação aos plantões de um profissional
class PlantoesUserService
  def initialize(params = {})
    @user_id = params[:user_id]
  end

  # Retorna uma escala de plantão que pode ser feito o check-in
  def plantoes_para_check_in
    get_plantoes_para_check_in
  end

  # caso exista, retorna um plantão que esteja com check_in e sem check_out
  def plantao_para_check_out
    get_plantao_para_check_out
  end

  # Busca os ultimos plantões do usuário
  def ultimos_plantoes
    get_ultimos_plantoes
  end

  # Busca os próximos plantões do usuário
  def proximos_plantoes
    get_proximos_plantoes
  end

  private

  def get_plantoes_para_check_in
    @plantoes_check_in = Escalamembro
                         .select('escalamembros.*, escaladays.data+turnos.hora_inicio as inicio, escaladays.data+turnos.hora_fim as fim, equipes.nome as equipe_nome')
                         .joins(escala: [:turno, { escaladay: { escalacmpt: :equipe } }])
                         .where("membro_id = #{@user_id} and check_in isnull and (escaladays.data + turnos.hora_inicio) between NOW() - INTERVAL '10 hours' and NOW() + INTERVAL '10 hours'")
  end

  def get_plantao_para_check_out
    @plantoes_check_out = Escalamembro
                          .select('escalamembros.*, escaladays.data+turnos.hora_inicio as inicio, escaladays.data+turnos.hora_fim as fim, equipes.nome as equipe_nome')
                          .joins(escala: [:turno, { escaladay: { escalacmpt: :equipe } }])
                          .where("membro_id = #{@user_id} and check_in notnull and check_out isnull")
  end

  def get_ultimos_plantoes
    @ultimos_plantoes = Escalamembro
                        .select('escalamembros.*, escaladays.data+turnos.hora_inicio as inicio, escaladays.data+turnos.hora_fim as fim, equipes.nome as nome_equipe, equipes.id as equipe_id')
                        .joins(escala: %i[escaladay turno])
                        .joins(escala: { escaladay: { escalacmpt: :equipe } })
                        .where("membro_id = #{@user_id} and (escaladays.data + turnos.hora_fim) < NOW()")
                        .order('inicio desc')
    # .joins('JOIN escalacmpts ON escaladays.escalacmpt_id = escalacmpts.id')
    # .joins('JOIN equipes ON escalacmpts.equipe_id = equipes.id')
  end

  def get_proximos_plantoes
    @ultimos_plantoes = Escalamembro
                        .select('escalamembros.*, escaladays.data+turnos.hora_inicio as inicio, escaladays.data+turnos.hora_fim as fim, equipes.nome as nome_equipe, equipes.id as equipe_id')
                        .joins(escala: %i[escaladay turno])
                        .joins(escala: { escaladay: { escalacmpt: :equipe } })
                        .where("membro_id = #{@user_id} and (escaladays.data + turnos.hora_fim) >= NOW()")
                        .order('inicio')
  end
end

# @plantao_para_check_in = plantao_para_check_in(@current_user)
# @plantao_para_check_out = plantao_para_check_out(@current_user)
# @ultimos_plantoes = plantao_para_check_out(@current_user)
# @proximos_plantoes = plantao_para_check_out(@current_user)
#
#
# user = current_user
# user = User.find 3 # Claudia
# equipes_do_usuario = user.equipes.map(&:id)
#
# erros = []
#
# if params[:cmpt].blank?
#   erros << { cmpt: "Deve ser informada" }
#   render status: 404, json: erros
# else
#   # Traz todas as escalas do mês, das equipes que o usuário faz parte
#   # Se na URL for enviado o usuário, lista somente os dias que ele está escalado
#   if params[:user_id].blank?
#     filtra_usuario = ''
#   else
#     filtra_usuario = "exists(select * from escalamembros m where m.escala_id=escalas.id and m.membro_id = #{user.id})"
#   end
#   escalas = Escalacmpt.where("cmpt = ? and escalacmpts.equipe_id in (?)", params[:cmpt], equipes_do_usuario)
#   render json: escalas, include: ['equipe', 'escaladays', 'escaladays.escalas', 'escaladays.escalas.turno', 'escaladays.escalas.escalamembros', 'escaladays.escalas.escalamembros.membro']
# end
