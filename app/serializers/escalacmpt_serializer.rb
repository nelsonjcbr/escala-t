class EscalacmptSerializer < ActiveModel::Serializer
  attributes :id, :cmpt

  belongs_to :equipe
  has_many :escaladays
end
