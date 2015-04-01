class EventLog < ActiveRecord::Base

  def entries
    Entry.where(uuid: uuid.downcase, major: major, minor: minor)
  end

  class << self
    def heatmap_data
      all = EventLog.all.map(&:entries).flatten
      single = all.uniq
      res = single.inject([]) do |arr, s|
        hash = {}
        hash[:x] = s.x.to_f
        hash[:y] = s.y.to_f
        hash[:value] = all.select{ |a| a.uuid == s.uuid && a.major == s.major && a.minor == s.minor }.count
        arr << hash
        arr
      end
      res
    end
  end

end
