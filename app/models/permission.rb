class Permission < ApplicationRecord
  has_many :roles_permissions
  validates :name, length: { maximum: 255 }, presence: true
  validates :en_name, length: { maximum: 255 }, presence: true, uniqueness: { case_sensitive: true }

  scope :product_permission,
        -> {
          where(en_name: ['product_reference',
                          'product_create',
                          'product_update',
                          'product_delete'])
        }
  scope :customer_permission,
        -> {
          where(en_name: ['customer_reference',
                          'customer_create',
                          'customer_update',
                          'customer_delete'])
        }
end
