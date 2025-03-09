class Escala < ApplicationRecord
  belongs_to :escaladay
  belongs_to :turno
  has_many :escalamembros, dependent: :destroy

  def disponivel?(user_id)
    escalamembro = Escalamembro.new(escala_id: id, membro_id: user_id)
    escalamembro.valid?
  end
end
