class Escala < ApplicationRecord
  belongs_to :escaladay
  belongs_to :turno
  has_many :escalamembros, dependent: :destroy 

end
