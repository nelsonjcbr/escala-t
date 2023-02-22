class Escalacmpt < ApplicationRecord
  belongs_to :equipe
  has_many :escaladays, dependent: :destroy 
  after_create :gera_escalas_cmpt

  def cmpt_formatada
    sCmpt = self[:cmpt].to_s
    sCmpt[0..3] + '-' + sCmpt[4..5]
  end

  def cmpt=(val)
    val = val[0..3] + val[5..6]
    self[:cmpt] = val
  end

  def gera_escalas_cmpt
    ano = self.cmpt.to_s[0..3].to_i
    mes = self.cmpt.to_s[4..5].to_i
    dia = 1
    # Grava um registro para cada dia
    while Date.valid_date?(ano, mes, dia) do
      data = Date.new(ano, mes, dia)
      d = Escaladay.new(escalacmpt_id: self.id, data: data)
      d.save!
      # Grava um registro para cada turno da equipe no dia
      self.equipe.turnos.each do |t| 
        e = Escala.new()
        e.escaladay_id = d.id
        e.turno_id = t.id 
        e.save!
      end
      dia += 1
    end
  end

  def update_membro (atributos)
    # Vem o individuo e os dias marcados para sua escala 
    atrib_json = JSON.parse(atributos.to_json)
    membro_id = atrib_json["membro_id"]
    dias_marcados = atrib_json["escalas_attributes"]
    unless dias_marcados.nil?
      if membro_id == ''
        # Testando para ver se retorna erro
        return
      end
      escalas = dias_marcados.keys.map { |k| k }
      escalas.each do |p|
        if (Escalamembro.where(escala_id: p, membro_id: membro_id).size == 0)
          salvo = Escalamembro.create(escala_id: p, membro_id: membro_id)
        end
      end
    end  
    # Pega o escalamembros_attributes que é onde fica os ids dos registros marcados para exclusão
    # Retorna algo assim: {"9"=>{"excluir"=>"1"}, "10"=>{"excluir"=>"1"}}
    excluir = atrib_json["escalamembros_attributes"]
    unless excluir.nil?
      escalamembros = excluir.keys.map { |k| k }
      escalamembros.each do |p|
        membro = Escalamembro.find(p)
        membro.destroy unless membro.nil?
      end  
    end
    return true
  end
end
