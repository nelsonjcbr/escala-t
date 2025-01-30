class UsersController < ApplicationController
  load_and_authorize_resource

  before_action :set_user, only: %i[show edit update destroy]
  before_action :set_selects, only: %i[edit new update create]
  before_action :set_tela

  add_breadcrumb 'Home', :root_path

  # GET /users or /users.json
  def index
    @users = if params[:search_query].nil?
               User.order(:id).page(params[:page]).per(50)
             else
               User.search(params[:search_query]).order(:id).page(params[:page]).per(50)
             end
    add_breadcrumb 'Usuários', users_path, title: 'Volta para a lista'
  end

  # GET /users/1 or /users/1.json
  def show
    add_breadcrumb 'Usuários', users_path, title: 'Volta para a lista'
    add_breadcrumb @user.nome_chamado
  end

  # GET /users/new
  def new
    @user = User.new
    add_breadcrumb 'Usuários', users_path, title: 'Volta para a lista'
    add_breadcrumb 'Novo'
  end

  # GET /users/1/edit
  def edit
    add_breadcrumb 'Usuários', users_path, title: 'Volta para a lista'
    add_breadcrumb @user.nome_chamado, @user
    add_breadcrumb 'Editar', edit_user_path(@user)
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "#{User.model_name.human} foi criado com sucesso." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      %i[password password_confirmation].collect { |p| params[:user].delete(p) } if params[:user][:password].blank?
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "#{User.model_name.human} foi editado com sucesso." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "#{User.model_name.human} removido com sucesso." }
      format.json { head :no_content }
    end
  end

  private

  def set_tela
    session[:tela_origem] = 'users'
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def set_selects
    @ufs = Uf.order(:nome).collect { |i| [i.nome, i.id] }
    @conselhoclasses = Conselhoclass.ordenado.collect { |i| [i.sigla, i.id] }
    @sexos = [%w[Masculino M], %w[Feminino F]]
    @estabelecimentos = Estabelecimento.all
  end

  # Only allow a list of trusted parameters through.
  def user_params
    # params.fetch(:user, {})
    params.require(:user).permit(:name, :email, :password, :nome_chamado, :cpf, :sexo, :profissao, :conselhoclass_id,
                                 :numero_conselho, :uf_conselho_id, :foto, :role, estabelecimento_ids: [])
  end
end
