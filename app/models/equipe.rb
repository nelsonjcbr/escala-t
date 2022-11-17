class Equipe < ApplicationRecord
  has_many :turnos, dependent: :destroy
  belongs_to :unidade
  validates :nome, :tipo_escala, :unidade_id, presence: true
  accepts_nested_attributes_for :turnos
end
