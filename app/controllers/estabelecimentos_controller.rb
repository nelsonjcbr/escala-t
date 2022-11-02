class EstabelecimentosController < ApplicationController
  before_action :set_estabelecimento, only: %i[ show edit update destroy ]

  # GET /estabelecimentos or /estabelecimentos.json
  def index
    @estabelecimentos = Estabelecimento.all
  end

  # GET /estabelecimentos/1 or /estabelecimentos/1.json
  def show
  end

  # GET /estabelecimentos/new
  def new
    @estabelecimento = Estabelecimento.new
    @cidades = [] 
    #@cidades = Cidade.order(:nome).where(uf: uf_sel).collect {|i| [ i.nome, i.id ] } 
  end

  # GET /estabelecimentos/1/edit
  def edit
    @cidades = [] 
  end

  # POST /estabelecimentos or /estabelecimentos.json
  def create
    @estabelecimento = Estabelecimento.new(estabelecimento_params)

    respond_to do |format|
      if @estabelecimento.save
        format.html { redirect_to estabelecimento_url(@estabelecimento), notice: "Estabelecimento was successfully created." }
        format.json { render :show, status: :created, location: @estabelecimento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @estabelecimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estabelecimentos/1 or /estabelecimentos/1.json
  def update
    respond_to do |format|
      if @estabelecimento.update(estabelecimento_params)
        format.html { redirect_to estabelecimento_url(@estabelecimento), notice: "Estabelecimento was successfully updated." }
        format.json { render :show, status: :ok, location: @estabelecimento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @estabelecimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estabelecimentos/1 or /estabelecimentos/1.json
  def destroy
    @estabelecimento.destroy

    respond_to do |format|
      format.html { redirect_to estabelecimentos_url, notice: "Estabelecimento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def cidades
    @target = params[:target]
    @cidades = Cidade.order(:nome).where(uf: params[:uf]).collect {|i| [ i.nome, i.id ] } 
    
    respond_to do |format|
      format.turbo_stream

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estabelecimento
      @estabelecimento = Estabelecimento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def estabelecimento_params
      params.require(:estabelecimento).permit(:nome, :cnpj, :cnes, :endereco, :end_numero, :bairro, :cidade, :uf, :cep, :api_url, :api_usuario, :api_senha)
    end
end
