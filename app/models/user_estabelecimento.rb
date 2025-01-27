class UserEstabelecimento < ApplicationRecord
  belongs_to :user
  belongs_to :estabelecimento
end
