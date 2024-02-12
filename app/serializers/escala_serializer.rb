class EscalaSerializer < ActiveModel::Serializer
  attributes :id, :turno

  belongs_to :turno
  has_many :escalamembros
end
