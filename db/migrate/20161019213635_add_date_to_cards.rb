class AddDateToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :year, :integer, :null => true, :default => nil
    add_column :cards, :month, :integer, :null => true, :default => nil
    add_column :cards, :day, :integer, :null => true, :default => nil
  end
end
