class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #adicionado campo novo no devise
  has_many :favorites
  has_many :recently_heards

  validates :name, presence: true

  def is_favorite? kind, id
    self.favorites.where(favoritable_type: kind, favoritable_id: id).present?
  end
end
