class GrandChild < ApplicationRecord
  belongs_to :child, :foreign_key => :child_no, :primary_key => :child_no
end
