class CreateParents < ActiveRecord::Migration[6.0]
  def change
    create_table :parents, comment: '親'  do |t|
      t.integer :parent_id, comment: '親ID'
      t.string :parent_no, limit: 12, comment: '親番号'
      t.string :parent_name, limit: 64, null: false, comment: '親名'
      t.timestamps

      t.index :parent_id, unique: true, name: 'parents_idx_01'
      t.index :parent_no, unique: true, name: 'parents_idx_02'
    end
  end
end
