class AddCoordinatesToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :x, :decimal
    add_column :entries, :y, :decimal
  end
end
