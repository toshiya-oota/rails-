class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products, :comment => '商品' do |t|
      t.string :product_div, :limit => 3, :null => false, :comment => '商品区分'
      t.string :item_cd, :limit => 5, :null => false, :comment => '商品コード'
      t.string :product_cd, :limit => 8, :null => false, :comment => '製品コード'
      t.string :name, :limit => 255, :null => false, :comment => '商品名'
      t.integer :category, :default => 0, :null => false, :comment => 'カテゴリ 0: その他 / 1: アウター / 2: ボトムス / 3: シャツ / 4: カットソー / 5: ニット / 6: グッズ / 7: インナ-'
      t.integer :sex, :null => false, :comment => '性別 1: ユニセックス / 2: 女性 / 3: 男性'
      t.integer :status, :default => 0, :null => false, :comment => '状態 0: 無効 / 1: 有効 / 2: セール価格 / 3: 売価変更 /　4: 終売'
      t.datetime :sale_start, :comment => '販売開始日'
      t.datetime :sale_end, :comment => '販売終了日'
      t.string :image, :comment => '画像'
      t.timestamps
      t.index :product_cd, :unique => true, :name => 'product_cds_idx_01'
    end
  end
end
