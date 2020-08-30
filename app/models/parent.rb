class Parent < ApplicationRecord
  has_many :child, foreign_key: :parent_id
end
