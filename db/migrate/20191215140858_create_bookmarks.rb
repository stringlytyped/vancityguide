class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.belongs_to :owner, foreign_key: { to_table: :users }, null: false
      t.references :poi, foreign_key: true, null: false

      t.index [:owner_id, :poi_id], unique: true

      t.timestamps
    end
  end
end
