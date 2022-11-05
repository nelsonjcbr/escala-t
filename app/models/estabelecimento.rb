class Estabelecimento < ApplicationRecord
  belongs_to :uf
  belongs_to :cidade
  has_many :unidades
  validates :nome, :cnpj, :uf, :cidade, presence: true

  def cidade_uf
    self.cidade.nome+'('+self.uf.sigla + ')'
  end

end
