class Book < ActiveRecord::Base
  belongs_to :publisher

  has_many :authors, through: :book_authors
  has_many :book_authors

  # rails cでBook.costと実行すると、↓のクエリが発行される
  scope :cost, -> { where("price > ?", 2000) }

end
