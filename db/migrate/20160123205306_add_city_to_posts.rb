class AddCityToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :city, :string, null: false
  end
end
