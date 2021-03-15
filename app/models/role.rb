class Role < ApplicationRecord
  has_many :system_users_roles, dependent: :destroy
  has_many :roles_permissions, dependent: :destroy
  has_many :permissions, through: :roles_permissions, source: :permission

  validates :name, length: { maximum: 255 }
end
