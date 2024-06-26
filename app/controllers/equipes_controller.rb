class EquipesController < ApplicationController
  load_and_authorize_resource

  before_action :set_equipe, only: %i[ show edit update destroy ]
  before_action :set_tiposescala, only: %i[ edit new update create]
  before_action :set_selects, only: %i[ edit new update create]
  before_action :seta_tela

  add_breadcrumb "Home", :root_path

  # GET /equipes or /equipes.json
  def index
    unless params[:search_query].nil?
      @equipes = Equipe.includes(:membros).search(params[:search_query]).ordenado
    else
      @equipes = Equipe.includes(:membros).all
    end
    add_breadcrumb "Equipes", equipes_path, title: 'Volta a lista'
  end

  # GET /equipes/1 or /equipes/1.json
  def show
    add_breadcrumb "Equipes", equipes_path, title: 'Volta a lista'
  end

  # GET /equipes/new
  def new
    @equipe = Equipe.new
    4.times { |i| @equipe.turnos.build(:ordem => i+1) }
    #20.times { |i| @equipe.membros.build() }
  end

  # GET /equipes/1/edit
  def edit
    #qtde = @equipe.turnos.size
    # 4-qtde.times { |i| @equipe.turnos.build(:ordem => i+1+qtde) } if qtde < 4
  end

  # POST /equipes or /equipes.json
  def create
    @equipe = Equipe.new(equipe_params)
    @equipe.turnos.each { |turno| @equipe.turnos.destroy(turno) if turno.hora_inicio.nil? && turno.hora_fim.nil? }
    @equipe.membros.each { |membro| @equipe.membros.destroy(membro) if membros.user.nil? }

    respond_to do |format|
      if @equipe.save
        format.html { redirect_to equipes_path, notice: "Equipe was successfully created." }
        format.json { render :show, status: :created, location: @equipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @equipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipes/1 or /equipes/1.json
  def update
    # Apaga os turnos que já tem, senão duplica
    @equipe.turnos.each { |turno| @equipe.turnos.destroy(turno) }
    @equipe.membros.each { |membro| @equipe.membros.destroy(membro) if membros.user.nil? }
    respond_to do |format|
      if @equipe.update(equipe_params)
        format.html { redirect_to equipes_path, notice: "Equipe was successfully updated." }
        format.json { render :show, status: :ok, location: @equipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @equipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipes/1 or /equipes/1.json
  def destroy
    @equipe.destroy

    respond_to do |format|
      format.html { redirect_to equipes_url, notice: "Equipe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipe
      @equipe = Equipe.find(params[:id])
    end

    def set_tiposescala
      @tipos_escala = [['5x1'], ['5x2'], ['4x2'], ['6x1'], ['12x36'], ['18x36'], ['24x48']]
    end

    def set_selects 
      @unidades = Unidade.includes(:estabelecimento).all.collect { |i| [i.nome+' #'+i.estabelecimento.nome, i.id] }
    end

    def seta_tela
      session[:tela_origem] = 'equipes'
    end
  
    # Only allow a list of trusted parameters through.
    def equipe_params
      params.require(:equipe).permit(:nome, :tipo_escala, :unidade_id, 
        turnos_attributes: [ :ordem, :hora_inicio, :hora_fim],
        membros_attributes: [:user_id, :destroy])
    end
end
