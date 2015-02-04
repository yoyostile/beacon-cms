class AddEntriesTable < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.timestamps

      t.string :headline
      t.text :description
      t.string :url
      t.string :image
      t.string :uuid
      t.string :major
      t.string :minor
    end
  end
end
