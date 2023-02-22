class Escalamembro < ApplicationRecord
  belongs_to :membro, class_name: "User"
  belongs_to :escala
end
