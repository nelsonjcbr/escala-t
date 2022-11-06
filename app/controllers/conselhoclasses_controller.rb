class ConselhoclassesController < ApplicationController
  def index
    @conselhoclasses = Conselhoclass.ordenado
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
end