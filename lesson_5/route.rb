require_relative 'instance_counter'

class Route
  attr_reader :list

  include InstanceCounter::InstanceMethods
  extend InstanceCounter::ClassMethods

  def initialize(start_station, finish_station)
    @list = [start_station, finish_station]
  end

  def add(station)
    @list.insert(@list.count - 1, station)
  end
  
  def del(station)
    @list.delete(station)
  end 

  def register_instance
    super
  end
end
