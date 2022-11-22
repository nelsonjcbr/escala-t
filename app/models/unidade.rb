class Unidade < ApplicationRecord
  belongs_to :estabelecimento
  has_many :equipes
  validates :nome, :estabelecimento_id, presence: true
end
