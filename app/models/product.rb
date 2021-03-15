class Product < ApplicationRecord
  mount_uploader :image, ProductImageUploader

  has_many :product_details, inverse_of: :product, dependent: :destroy

  enum :category => { :outer => 1, :bottoms => 2, :shirts => 3, :cutsew => 4, :nit => 5, :goods => 6, :inner => 7 }
  enum :sex => { :gender_free => 1, :womens => 2, :mens => 3 }
  enum :status => { :disabled => 0, :normal => 1, :sale => 2, :pricedown => 3, :end => 4 }

  accepts_nested_attributes_for :product_details, :allow_destroy => true

  #バリデーション
  validates :product_div, :presence => true, :length => { :maximum => 3 }
  validates :item_cd, :presence => true, :length => { :maximum => 5 }
  validates :product_cd, :presence => true, :length => { :maximum => 8 }, :uniqueness => true
  validates :name, :presence => true, :length => { :maximum => 255 }
  validates :category, :presence => true
  validates :sex, :presence => true
  validates :status, :presence => true

  #カスタムバリデーション
  validate :sale_start_cannot_be_in_the_past
  validate :sale_end_cannot_be_before_sale_start

  def sale_start_cannot_be_in_the_past
    if sale_start.present? && sale_start < Date.today
      errors.add(:sale_start, "は過去日を指定出来ません。")
    end
  end

  def sale_end_cannot_be_before_sale_start
    if sale_end.present? && sale_start.present? && sale_end < sale_start
      errors.add(:sale_end, "は販売開始日時より過去を指定出来ません。")
    end
  end
end
