class Membro < ApplicationRecord
  belongs_to :equipe
  belongs_to :user
end
