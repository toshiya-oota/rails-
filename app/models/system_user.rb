class SystemUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :authentication_keys => [:login_id]

  enum :admin => { :admin => true, :general => false }

  has_many :system_users_roles,  dependent: :destroy
  has_many :roles, through: :system_users_roles, source: :role
end
