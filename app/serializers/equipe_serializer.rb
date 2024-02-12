class EquipeSerializer < ActiveModel::Serializer
  attributes :id, :nome, :tipo_escala

  belongs_to :unidade
end
