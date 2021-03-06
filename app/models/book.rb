class Book < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :author, presence: true
  validates :description, presence: true
  validates :publishing_house, presence: true
  validates :image, attachment_presence: true

  belongs_to :user
  has_many :reviews, dependent: :destroy

  has_attached_file :image, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


end
