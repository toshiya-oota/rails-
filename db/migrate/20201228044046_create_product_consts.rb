class CreateProductConsts < ActiveRecord::Migration[6.0]
  def change
    create_table :product_consts, :comment => '商品' do |t|
      t.integer :const_id, :null => false, :comment => 'コンスタントID'
      t.string :const_div, :limit => 5, :null => false, :comment => 'コンスタント区分'
      t.string :const_cd, :limit => 20, :null => false, :comment => 'コンスタントCD'
      t.string :const_cd_text, :limit => 128, :comment => 'コンスタントCD内容'
      t.decimal :const_cd_value, :precision => 11, :scale => 3, :comment => 'コンスタントCD値'
      t.integer :sort_no, :comment => '出力順'
      t.index :const_id, :unique => true, :name => 'product_consts_idx_01'

      t.timestamps
    end
  end
end
