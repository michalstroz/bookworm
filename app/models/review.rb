class Review < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  validates :contents, presence: true, length: { in: 5..1000 }
  belongs_to :book
end
