class Customer < ApplicationRecord
  scope :search_tel, lambda { |tel|
    if tel.include?("-")
      where("REPLACE(tel, '-', '') = ?", tel.delete("-"))
    else
      where("REPLACE(tel, '-', '') = ?", tel)
    end
  }

  def self.ransackable_scopes(_auth_object = nil)
    %i[search_tel]
  end
end
