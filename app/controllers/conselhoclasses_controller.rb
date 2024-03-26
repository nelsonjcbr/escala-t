class ConselhoclassesController < ApplicationController
  load_and_authorize_resource

  before_action :seta_tela

  add_breadcrumb "Home", :root_path
  
  def index
    unless params[:search_query].nil?
      @conselhoclasses = Conselhoclass.search(params[:search_query]).ordenado
    else
      @conselhoclasses = Conselhoclass.ordenado
    end
    add_breadcrumb "Conselhos de Classe", conselhoclasses_path, title: "Volta para a lista"
  end

  def new
    @conselhoclass = Conselhoclass.new 
  end

  def create
    @conselhoclass = Conselhoclass.new(conselhoclass_params)

    if @conselhoclass.save
      redirect_to conselhoclasses_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @conselhoclass = Conselhoclass.find(params[:id])
  end

  def update
    @conselhoclass = Conselhoclass.find(params[:id])

    if @conselhoclass.update(conselhoclass_params)
      redirect_to conselhoclasses_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    Conselhoclass.destroy(params[:id])
    redirect_to conselhoclasses_path
  end

  private

  def conselhoclass_params
    params.require(:conselhoclass).permit(:sigla, :nome)
  end

  def seta_tela
    session[:tela_origem] = 'conselhoclasses'
  end
end