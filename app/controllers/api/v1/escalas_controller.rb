class Api::V1::EscalasController < Api::V1::ApiGestorController
	respond_to :json

  # GET /api/v1/escala
  # Recebe a competencia e o usuario(vem login)retorna:
  # . Equipe - cmpt
  # .. Data 
  # ... Turno
  # .... Plantonistas 
  
  def index
    user = current_user
    user = User.find 3 # Claudia
    equipes_do_usuario = user.equipes.map(&:id)
    erros = []
    if params[:cmpt].blank?
      erros << { cmpt: "Deve ser informada" }
      render status: 404, json: erros
    else
      # Traz todas as escalas do mês, das equipes que o usuário faz parte
      # Se na URL for enviado o usuário, lista somente os dias que ele está escalado
      if params[:user_id].blank?
        filtra_usuario = ''
      else
        filtra_usuario = "exists(select * from escalamembros m where m.escala_id=escalas.id and m.membro_id = #{user.id})"
      end
      escalas = Escalacmpt.where("cmpt = ? and escalacmpts.equipe_id in (?)", params[:cmpt], equipes_do_usuario)
      render json: escalas, include: ['equipe', 'escaladays', 'escaladays.escalas', 'escaladays.escalas.turno', 'escaladays.escalas.escalamembros', 'escaladays.escalas.escalamembros.membro']
    end
  end

    def index_antes
      user = current_user
      user = User.find 3 # Claudia
      equipes_do_usuario = user.equipes.map(&:id)
      erros = []
      if params[:cmpt].blank?
        erros << { cmpt: "Deve ser informada" }
        render status: 404, json: erros
      else
        # Traz todas as escalas do mês, das equipes que o usuário faz parte
        # Se na URL for enviado o usuário, lista somente os dias que ele está escalado
        if params[:user_id].blank?
          filtra_usuario = ''
        else
          filtra_usuario = "exists(select * from escalamembros m where m.escala_id=escalas.id and m.membro_id = #{user.id})"
        end
        escalas = Escala.joins("inner join escaladays on escaladays.id=escalas.escaladay_id 
          inner join escalacmpts on escalacmpts.id=escaladays.escalacmpt_id")
          .where(filtra_usuario)
          .where("cmpt = ? and escalacmpts.equipe_id in (?)", params[:cmpt], equipes_do_usuario)
        escalas_json = escalas.as_json(only: [:id, 'escaladays.data'], include: {  escaladay: {only: [:id, :data] }, 
                                                                turno: {except: [:created_at, :updated_at]}, 
                                                                escalamembros: {only: [:id],
                                                                  include: { membro: {only: [:id, :cpf, :name, :nome_chamado]}}
                                                                }
                                     } )
        render json: {status: 'SUCCESS', message:'Escalas carregadas', data:escalas_json},status: :ok
      end
      
  end
end
