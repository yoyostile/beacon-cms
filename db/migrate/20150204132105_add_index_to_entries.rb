class AddIndexToEntries < ActiveRecord::Migration
  def change
    add_index :entries, [:uuid, :major, :minor]
  end
end
