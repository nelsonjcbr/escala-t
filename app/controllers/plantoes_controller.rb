class PlantoesController < ApplicationController

  def abrir_plantao
    # Lógica para abrir o plantão
    @escalamembro = Escalamembro.find(params[:plantao_id])
    @escalamembro.check_in = DateTime.now
    respond_to do |format|
      if @escalamembro.save
        format.html { redirect_to :root_path, notice: "Plantão aberto com sucesso!" }
        format.json { render :show, status: :ok, location: @escalamembro }
      else
        format.html { redirect_to :root_path, notice: "Erro na abertura do plantão!" }
        format.json { render json: @escalamembro.errors, status: :unprocessable_entity }
      end
    end
  end

  def fechar_plantao
    # Lógica para abrir o plantão
    @escalamembro = Escalamembro.find(params[:plantao_id])
    @escalamembro.check_out = DateTime.now
    respond_to do |format|
      if @escalamembro.save
        format.html { redirect_to :root_path, notice: "Plantão fechado com sucesso!" }
        format.json { render :show, status: :ok, location: @escalamembro }
      else
        format.html { redirect_to :root_path, notice: "Erro no fechamento do plantão!" }
        format.json { render json: @escalamembro.errors, status: :unprocessable_entity }
      end
    end
  end
end
