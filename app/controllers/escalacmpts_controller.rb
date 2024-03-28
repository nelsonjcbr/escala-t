class EscalacmptsController < ApplicationController
  load_and_authorize_resource

  before_action :set_escalacmpt, only: %i[ show edit update destroy ]
  before_action :set_selects, only: %i[ edit new update create]
  before_action :set_membros, only: %i[ show edit update]

  before_action :seta_tela

  add_breadcrumb "Home", :root_path

  # GET /escalacmpts or /escalacmpts.json
  def index
    unless params[:search_query].nil?
      @escalacmpts = Escalacmpt.search(params[:search_query]).order('cmpt desc, equipe_id').page(params[:page]).per(50)
    else
      @escalacmpts = Escalacmpt.order('cmpt desc, equipe_id').page(params[:page]).per(50)
    end
    add_breadcrumb "Escalas", escalacmpts_path
  end 

  # GET /escalacmpts/1 or /escalacmpts/1.json
  def show
    add_breadcrumb "Escalas", escalacmpts_path, title: 'Volta a lista de escalas'
  end

  # GET /escalacmpts/new
  def new
    @escalacmpt = Escalacmpt.new
    add_breadcrumb "Escalas", escalacmpts_path, title: 'Volta a lista de escalas'
  end

  # GET /escalacmpts/1/edit
  def edit
    add_breadcrumb "Escalas", escalacmpts_path, title: 'Volta a lista de escalas'
  end

  # POST /escalacmpts or /escalacmpts.json
  def create
    @escalacmpt = Escalacmpt.new(escalacmpt_params)

    respond_to do |format|
      if @escalacmpt.save
        format.html { redirect_to escalacmpt_url(@escalacmpt), notice: "Escalacmpt was successfully created." }
        format.json { render :show, status: :created, location: @escalacmpt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @escalacmpt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /escalacmpts/1 or /escalacmpts/1.json
  def update
    respond_to do |format|
      if @escalacmpt.update_membro(params[:escalacmpt])
        format.html { redirect_to escalacmpt_url(@escalacmpt), notice: "Escalacmpt was successfully updated." }
        format.json { render :show, status: :ok, location: @escalacmpt }
      else
        flash[:notice] = 'ERRO: Existe adição de um profissional em um turno mas o profissional não está selecionado'
        #flash.now[:alert] = 'Existe adição de um profissional em um turno mas o profissional não está selecionado'
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @escalacmpt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /escalacmpts/1 or /escalacmpts/1.json
  def destroy
    @escalacmpt.destroy

    respond_to do |format|
      format.html { redirect_to escalacmpts_url, notice: "Escalacmpt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def resumo
    @escalacmpt = Escalacmpt.find(params[:escalacmpt_id])
    # Escalacmpt ->* escaladays ->* escalas(turnos) ->* escalamembros
    @resumo = Escalamembro.find_by_sql("
      select u.nome_chamado, em.membro_id, count(*) as turnos from escalacmpts ec
        inner join escaladays    d  on d.escalacmpt_id=ec.id
        inner join escalas       e  on e.escaladay_id=d.id
        inner join escalamembros em on em.escala_id=e.id
        inner join users         u  on u.id=em.membro_id
        where ec.id = #{@escalacmpt.id}
        group by 1,2
      ")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_escalacmpt
      @escalacmpt = Escalacmpt.find(params[:id])
    end

    def set_selects
      @equipes = Equipe.all.collect {|e| [e.nome, e.id]}
    end

    def set_membros 
      @membros = @escalacmpt.equipe.membros.collect {|e| [e.user.nome_chamado, e.user.id] }
    end 

    def seta_tela
      session[:tela_origem] = 'escalacmpts'
    end

    # Only allow a list of trusted parameters through.
    def escalacmpt_params
      params.require(:escalacmpt).permit(:equipe_id, :cmpt)
    end
end
