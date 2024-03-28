class EstabelecimentosController < ApplicationController
  load_and_authorize_resource

  before_action :authenticate_user!
  before_action :set_estabelecimento, only: %i[ show edit update destroy ]
  before_action :carrega_cidades, only: %i[ new edit update create ]
  before_action :carrega_ufs, only: %i[ new edit update create ]

  before_action :seta_tela

  add_breadcrumb "Home", :root_path
  
  # GET /estabelecimentos or /estabelecimentos.json
  def index
    unless params[:search_query].nil?
      @estabelecimentos = Estabelecimento.includes([:cidade, :uf]).search(params[:search_query])
    else
      @estabelecimentos = Estabelecimento.all.includes([:cidade, :uf])
    end
    add_breadcrumb "Estabelecimentos", estabelecimentos_path, title: "Volta para a lista"
  end

  # GET /estabelecimentos/1 or /estabelecimentos/1.json
  def show
    add_breadcrumb "Estabelecimentos", estabelecimentos_path, title: "Volta para a lista"
    add_breadcrumb @estabelecimento.nome, @estabelecimento
  end

  # GET /estabelecimentos/new
  def new
    @estabelecimento = Estabelecimento.new
    #@cidades = Cidade.order(:nome).where(uf: uf_sel).collect {|i| [ i.nome, i.id ] } 
    add_breadcrumb "Estabelecimentos", estabelecimentos_path, title: "Volta para a lista"
    add_breadcrumb "Novo"
  end

  # GET /estabelecimentos/1/edit
  def edit
    add_breadcrumb "Estabelecimentos", estabelecimentos_path, title: "Volta para a lista"
    add_breadcrumb "Editar", edit_estabelecimento_path(@estabelecimento)
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
    def carrega_ufs
      @ufs = Uf.order(:nome).collect {|i| [ i.nome, i.id ] }
    end

    def carrega_cidades
      if @estabelecimento.nil? || @estabelecimento.uf_id.nil?
        @cidades = []
      else  
        @cidades = Cidade.order(:nome).where(uf: @estabelecimento.uf_id).collect {|i| [ i.nome, i.id ] } 
      end
    end

    def seta_tela
      session[:tela_origem] = "estabelecimentos"
    end

    # Only allow a list of trusted parameters through.
    def estabelecimento_params
      params.require(:estabelecimento).permit(:nome, :cnpj, :cnes, :endereco, :end_numero, :bairro, :uf_id, :cidade_id, :cep, :api_url, :api_usuario, :api_senha)
    end
end
