class Unidade < ApplicationRecord
  belongs_to :estabelecimento, counter_cache: true
  has_many :equipes
  validates :nome, :estabelecimento_id, presence: true
end
