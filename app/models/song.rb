class Song < ApplicationRecord
  belongs_to :album
  validates :title, presence: true

  #tera um arquivo de audio associado a ela
  has_one_attached :file
end
