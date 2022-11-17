class Turno < ApplicationRecord
  belongs_to :equipe
  validates :hora_inicio, :hora_fim, :ordem, presence: true
  validates :ordem, uniqueness: { scope: :equipe_id, message: "Não pode repetir a mesma ordem nos turnos" }
end
