class ProductDetail < ApplicationRecord
  belongs_to :product

  enum size: { S: 1, M: 2, L: 3, XL: 4 }
  enum season: { spring: 1, summer: 2, autumn: 3, winter: 4 }
  enum product_country: { Japan: 0, China: 1, Bangladesh: 2 }
end
