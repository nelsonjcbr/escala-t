class UnidadesController < ApplicationController
  before_action :set_unidade, only: %i[ show edit update destroy ]
  before_action :set_estabelecimento, only: %i[index edit new show]

  # GET /unidades or /unidades.json
  def index
    @unidades = Unidade.where(estabelecimento_id: params[:estabelecimento_id])
  end

  # GET /unidades/1 or /unidades/1.json
  def show
  end

  # GET /unidades/new
  def new
    @unidade = Unidade.new(estabelecimento_id: params[:estabelecimento_id])
  end

  # GET /unidades/1/edit
  def edit
  end

  # POST /unidades or /unidades.json
  def create
    @unidade = Unidade.new(unidade_params)
    @unidade.estabelecimento_id = params[:estabelecimento_id]

    respond_to do |format|
      if @unidade.save
        format.html { redirect_to estabelecimento_unidades_path(@unidade.estabelecimento_id), notice: "Unidade was successfully created." }
        format.json { render :show, status: :created, location: @unidade }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @unidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unidades/1 or /unidades/1.json
  def update
    respond_to do |format|
      if @unidade.update(unidade_params)
        format.html { redirect_to estabelecimento_unidades_url(@unidade.estabelecimento_id), notice: "Unidade was successfully updated." }
        format.json { render :show, status: :ok, location: @unidade }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @unidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unidades/1 or /unidades/1.json
  def destroy
    @unidade.destroy

    respond_to do |format|
      format.html { redirect_to estabelecimento_unidades_path, notice: "Unidade was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unidade
      @unidade = Unidade.find(params[:id])
    end

    def set_estabelecimento
      @estabelecimento = Estabelecimento.find(params[:estabelecimento_id])
    end

    # Only allow a list of trusted parameters through.
    def unidade_params
      params.require(:unidade).permit(:nome, :estabelecimento_id)
    end
end
