class ProductConst < ApplicationRecord
  scope :product_divison, -> { where(:const_div => "P0001").order(:sort_no) }
  scope :color, -> { where(:const_div => "P0003").order(:sort_no) }
end
