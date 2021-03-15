class SystemUsersRole < ApplicationRecord
  belongs_to :system_user
  belongs_to :role
end
