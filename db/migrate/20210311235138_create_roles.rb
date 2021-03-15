class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :name, limit: 255, comment: 'ロール名'

      t.timestamps
    end
  end
end
