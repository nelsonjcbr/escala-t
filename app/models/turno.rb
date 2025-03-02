class Turno < ApplicationRecord
  belongs_to :equipe
  has_many :escalas
  validates :hora_inicio, :hora_fim, :ordem, presence: true
  validates :ordem, uniqueness: { scope: :equipe_id, message: 'Não pode repetir a mesma ordem nos turnos' }

  self.skip_time_zone_conversion_for_attributes = %i[hora_inicio hora_fim]
end
