class User < ApplicationRecord
  # has_paper_trail
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_confirmation_of :password
  validates :nome_chamado, :cpf, presence: true
  validates :email, uniqueness: true
  validates :conselhoclass_id, :numero_conselho, :uf_conselho_id, presence: true

  # validate :password_complexity

  has_many :user_estabelecimentos, dependent: :destroy
  has_many :estabelecimentos, through: :user_estabelecimentos
  has_many :membros, dependent: :destroy
  has_many :equipes, through: :membros
  has_many :escalamembros, foreign_key: 'membro_id'
  has_many :fones, dependent: :destroy
  accepts_nested_attributes_for :fones, allow_destroy: true
  has_many :user_indisps, dependent: :destroy
  accepts_nested_attributes_for :user_indisps, allow_destroy: true
  belongs_to :conselhoclass
  belongs_to :uf, class_name: 'Uf', foreign_key: 'uf_conselho_id'

  include ImageUploader::Attachment(:foto)

  enum role: { admin: 0, organizer: 1, user: 2 }

  def password_complexity
    if password.present?
      unless password.scan(/\d/).size > 0 && password.scan(/[a-zA-Z]/).size > 0
        errors.add :password,
                   ' A senha deve possuir no mínimo 8 caracteres, dos quais pelo menos um deve ser letra e pelo menos um deve ser número'
      end
      errors.add :password, ' A senha deve possuir no mínimo 8 caracteres' if password.length < 8
    end
    errors.blank?
  end

  def eh_inovadora?
    email.to_s.split('@').last == 'inovadora.com.br'
  end

  def self.search(query)
    where('name iLIKE ?', "%#{query}%")
  end
end
