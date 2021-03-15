class  Child < ApplicationRecord
  belongs_to :parent
  has_many :grand_children, :foreign_key => :child_no, :primary_key => :child_no
end
