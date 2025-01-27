class Estabelecimento < ApplicationRecord
  belongs_to :uf, optional: true
  belongs_to :cidade, optional: true
  has_many :unidades
  validates :nome, :cnpj, presence: true
  has_many :user_estabelecimentos
  has_many :users, through: :user_estabelecimentos
  def cidade_uf
    cidade.nome + '(' + uf.sigla + ')'
  end

  def self.search(query)
    where('nome ilike ?', "%#{query}%")
  end
end
