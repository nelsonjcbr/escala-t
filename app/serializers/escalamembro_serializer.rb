class EscalamembroSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :membro, class_name: 'User'
end
