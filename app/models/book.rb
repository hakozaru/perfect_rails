class Book < ActiveRecord::Base

  # rails cでBook.costと実行すると、↓のクエリが発行される
  scope :cost, -> { where("price > ?", 2000) }

end
