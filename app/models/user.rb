class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nome_chamado, :cpf, presence: true

  include ImageUploader::Attachment(:foto)

  enum role: { admin: 0, organizer: 1, user: 2 }
 
end
