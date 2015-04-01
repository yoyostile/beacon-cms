class EventLog < ActiveRecord::Base

  def entries
    Entry.where(uuid: uuid.downcase, major: major, minor: minor)
  end

  class << self
    def heatmap_data
      EventLog.all.map(&:entries).flatten.map{ |entry| { x: entry.x.to_f, y: entry.y.to_f, value: 10 } }
    end
  end

end
