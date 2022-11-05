class Unidade < ApplicationRecord
  belongs_to :estabelecimento
  validates :nome, :estabelecimento_id, presence: true
end
