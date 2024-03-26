class Conselhoclass < ApplicationRecord
  validates :sigla, :nome, presence: true
  scope :ordenado, -> { order(sigla: :asc) } 

  def self.search(query)
    where("sigla iLIKE ? or nome ilike ?", "%#{query}%", "%#{query}%")
  end
end
