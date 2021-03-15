class CreateChildren < ActiveRecord::Migration[6.0]
  def change
    create_table :children, :comment => '子'  do |t|
      t.integer :parent_id, :comment => '親ID'
      t.string :child_no, :limit => 12, :comment => '子番号'
      t.string :child_name, :limit => 64, :null => false, :comment => '子名'
      t.timestamps

      t.index :child_no, :unique => true, :name => 'children_idx_01'
      t.index %i(parent_id child_no), :unique => true, :name => 'children_idx_02'
    end
  end
end
