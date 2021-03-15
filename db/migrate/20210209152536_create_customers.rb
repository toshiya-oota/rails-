class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name, :limit => 255, :null => false, :comment => '氏名'
      t.string :email, :limit => 255, :null => false, :comment => 'メールアドレス'
      t.string :tel, :limit => 20, :comment => '電話番号'
      t.string :address1, :limit => 255, :comment => '住所1'
      t.string :address2, :limit => 255, :comment => '住所2'

      t.timestamps
    end
  end
end
