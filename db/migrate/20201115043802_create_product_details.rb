class CreateProductDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :product_details, :comment => '商品詳細' do |t|
      t.references :product, :foreign_key => true, :null => false, :comment => '商品ID'
      t.string :color, :comment => 'カラー'
      t.integer :size, :default => 0, :null => false, :comment => 'サイズ 0: サイズフリー / 1: S / 2: M /3: L / 4: XL'
      t.integer :season, :default => 0, :null => false, :comment => 'シーズン 0: シーズンレス / 1: 春 / 2: 夏 / 3: 秋 / 4: 冬'
      t.integer :product_country, :default => 0, :null => false, :comment => '生産国 0:不明 / 00: アジア / 01: 北米 /02: 南米 / 03: 欧州 / 04: アフリカ'
      t.date :scheduled_arrive, :comment => '入荷予定日'
      
      t.timestamps
    end
  end
end
