class CreatePois < ActiveRecord::Migration[5.2]
  def change
    create_table :pois do |t|
      t.boolean :public, null: false
      t.boolean :featured, null: false
      t.string :name, null: false
      t.integer :rating, limit: 1
      t.string :website
      t.string :price
      t.text :description
      t.belongs_to :owner, foreign_key: { to_table: :users }, null: false
      t.integer :category, null: false

      t.timestamps
    end
  end
end
