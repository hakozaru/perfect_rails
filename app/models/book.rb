class Book < ActiveRecord::Base
  belongs_to :publisher

  has_many :authors, through: :book_authors
  has_many :book_authors

  # rails cでBook.costと実行すると、↓のクエリが発行される
  scope :cost, -> { where("price > ?", 2000) }

  validates :name, presence: true, length: { maximum: 10 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  # この条件を満たした場合のみログを記録する
  # (条件を満たしても満たさなくても当然データは消える)
  def low_price
    price < 1000
  end

  # |tes|の部分は何でもいい(bookでもfooでも)
  after_destroy if: :low_price do |tes|
    Rails.logger.info "Book is deleted: #{tes.attributes.inspect}"
  end

end
