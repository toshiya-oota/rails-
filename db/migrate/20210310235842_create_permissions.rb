class CreatePermissions < ActiveRecord::Migration[6.0]
  def change
    create_table :permissions do |t|
      t.string :name, null: false, limit: 255, comment: '権限名'
      t.string :en_name, null: false, limit: 255, unique: true, comment: '権限名英字'

      t.timestamps
    end
  end
end
