class Estabelecimento < ApplicationRecord
  belongs_to :uf, optional: true
  belongs_to :cidade, optional: true
  has_many :unidades
  validates :nome, :cnpj, presence: true

  def cidade_uf
    self.cidade.nome+'('+self.uf.sigla + ')'
  end

end
