class EscaladaySerializer < ActiveModel::Serializer
  attributes :data

  has_many :escalas
end
