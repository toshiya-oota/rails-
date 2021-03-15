class CreateRolesPermissions < ActiveRecord::Migration[6.0]
  def change
    create_table :roles_permissions do |t|
      t.references :role, foreign_key: true, comment: 'ロール'
      t.references :permission, foreign_key: true, comment: '権限'

      t.timestamps
    end
  end
end
