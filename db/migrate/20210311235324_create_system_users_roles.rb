class CreateSystemUsersRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :system_users_roles do |t|
      t.references :system_user, foreign_key: true, comment: '管理ユーザ'
      t.references :role, foreign_key: true, comment: 'ロール'

      t.timestamps
    end
  end
end
