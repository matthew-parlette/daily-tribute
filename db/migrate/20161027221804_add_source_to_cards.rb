class AddSourceToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :source, :integer, :null => true, :default => nil
  end
end
