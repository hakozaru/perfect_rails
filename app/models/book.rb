class Book < ActiveRecord::Base
  belongs_to :publisher

  # rails cでBook.costと実行すると、↓のクエリが発行される
  scope :cost, -> { where("price > ?", 2000) }

end
