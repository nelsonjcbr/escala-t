class Conselhoclass < ApplicationRecord
  validates :sigla, :nome, presence: true
  scope :ordenado, -> { order(sigla: :asc) } 
end
