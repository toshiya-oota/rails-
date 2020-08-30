class CreateGrandChildren < ActiveRecord::Migration[6.0]
  def change
    create_table :grand_children, comment: '孫'  do |t|
      t.string :child_no, null: false, comment: '子番号'
      t.string :grand_child_name, limit: 64, null: false, comment: '孫名'
      t.timestamps
    end
  end
end
