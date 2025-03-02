class UserIndisp < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validate :datas_required, if: -> { data_inicio.present? || data_fim.present? }
  validate :horarios_required, if: -> { hora_inicio.present? || hora_fim.present? }

  enum dias_semana: { Domingo: 1, Segunda: 2, Terça: 3, Quarta: 4, Quinta: 5, Sexta: 6, Sábado: 7 }

  self.skip_time_zone_conversion_for_attributes = %i[hora_inicio hora_fim]

  private

  # Validação para data_inicio e data_fim
  def datas_required
    errors.add(:data_inicio, 'deve ser preenchida se data_fim estiver preenchida') if data_inicio.blank?
    errors.add(:data_fim, 'deve ser preenchida se data_inicio estiver preenchida') if data_fim.blank?
    return unless data_inicio > data_fim

    errors.add(:data_inicio, 'deve ser menor ou igual à data de fim')
  end

  # Validação para hora_inicio e hora_fim
  def horarios_required
    errors.add(:hora_inicio, 'deve ser preenchida se hora_fim estiver preenchida') if hora_inicio.blank?
    errors.add(:hora_fim, 'deve ser preenchida se hora_inicio estiver preenchida') if hora_fim.blank?
    return unless hora_inicio > hora_fim

    errors.add(:hora_fim, 'deve ser maior ou igual a hora de inicio')
  end
end
