class TurnoSerializer < ActiveModel::Serializer
  attributes :id, :ordem, :hora_inicio, :hora_fim
end
