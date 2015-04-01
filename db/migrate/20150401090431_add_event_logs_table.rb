class AddEventLogsTable < ActiveRecord::Migration
  def change
    create_table :event_logs do |t|
      t.timestamps
      t.string :uuid
      t.string :major
      t.string :minor
      t.string :proximity
      t.string :rssi
    end
  end
end
