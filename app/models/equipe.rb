class Equipe < ApplicationRecord
  has_many :turnos, dependent: :destroy
  has_many :membros, dependent: :destroy
  belongs_to :unidade
  validates :nome, :tipo_escala, :unidade_id, presence: true
  accepts_nested_attributes_for :turnos
  scope :ordenado, -> { order(nome: :asc) } 

  def self.search(query)
    where("nome iLIKE ?", "%#{query}%")
  end

end
