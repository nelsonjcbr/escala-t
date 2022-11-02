class Estabelecimento < ApplicationRecord
  validates :nome, :cnpj, :cidade, presence: true

end
