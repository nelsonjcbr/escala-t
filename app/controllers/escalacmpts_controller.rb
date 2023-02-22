class EscalacmptsController < ApplicationController
  before_action :set_escalacmpt, only: %i[ show edit update destroy ]
  before_action :set_selects, only: %i[ edit new update create]
  before_action :set_membros, only: %i[ edit update]

  # GET /escalacmpts or /escalacmpts.json
  def index
    @escalacmpts = Escalacmpt.all
  end

  # GET /escalacmpts/1 or /escalacmpts/1.json
  def show
  end

  # GET /escalacmpts/new
  def new
    @escalacmpt = Escalacmpt.new
  end

  # GET /escalacmpts/1/edit
  def edit
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

    # Only allow a list of trusted parameters through.
    def escalacmpt_params
      params.require(:escalacmpt).permit(:equipe_id, :cmpt)
    end
end
