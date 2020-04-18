class Album < ApplicationRecord
  belongs_to :category
  belongs_to :artist
  has_many :songs

  validates :title, presence: true
  validates :date, presence: true

  #terá imagem salva no active storage
  has_one_attached :cover
end
