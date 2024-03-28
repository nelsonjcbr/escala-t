class MembrosController < ApplicationController
  load_and_authorize_resource

  before_action :set_membro, only: %i[ show edit update destroy ]
  before_action :set_equipe, only: %i[index edit new]

  add_breadcrumb "Home", :root_path
  
  # GET /membros or /membros.json
  def index
    @membros = Membro.where(equipe_id: params[:equipe_id])
    add_breadcrumb @equipe.nome, equipe_path(@equipe)
    add_breadcrumb "Membros", equipe_membros_path(@equipe)
  end

  # GET /membros/1 or /membros/1.json
  def show
  end

  # GET /membros/new
  def new
    @membro = Membro.new(equipe_id: params[:equipe_id])
  end

  # GET /membros/1/edit
  def edit
  end

  # POST /membros or /membros.json
  def create
    @membro = Membro.new(membro_params)
    @membro.equipe_id = params[:equipe_id]
    respond_to do |format|
      if @membro.save
        format.html { redirect_to equipe_membros_path(@membro.equipe_id), notice: "Membro was successfully created." }
        format.json { render :show, status: :created, location: @membro }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @membro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /membros/1 or /membros/1.json
  def update
    respond_to do |format|
      if @membro.update(membro_params)
        format.html { redirect_to equipe_membros_url(@membro.equipe_id), notice: "Membro was successfully updated." }
        format.json { render :show, status: :ok, location: @membro }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @membro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /membros/1 or /membros/1.json
  def destroy
    @membro.destroy

    respond_to do |format|
      format.html { redirect_to equipe_membros_path(@membro.equipe_id), notice: "Membro was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_membro
      @membro = Membro.find(params[:id])
    end

    def set_equipe
      @equipe = Equipe.find(params[:equipe_id])
    end

    # Only allow a list of trusted parameters through.
    def membro_params
      params.require(:membro).permit(:user_id, :equipe_id)
    end
end
