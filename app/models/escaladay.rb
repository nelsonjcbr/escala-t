class Escaladay < ApplicationRecord
  belongs_to :escalacmpt
  has_many :escalas, dependent: :destroy 
end
