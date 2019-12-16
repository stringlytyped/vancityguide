class AddCoordinatesToPois < ActiveRecord::Migration[5.2]
  def change
    add_column :pois, :lat, :float
    add_column :pois, :lon, :float
  end
end
