require_relative 'instance_counter'

class Route
  attr_reader :list
  @valid = false

  include InstanceCounter

  def initialize(start_station, finish_station)
    @list = [start_station, finish_station]
    validate!(@list)
    self.register_instance
  end

  def add(station)
    @list.insert(@list.count - 1, station)
  end
  
  def del(station)
    @list.delete(station)
  end

  def valid?
    validate!(@list)
    true
  rescue RegexpError
    false
  end

  protected
  ERROR = 'Stations in route must be uniq'
 
  def validate!(list)
    raise ERROR if list.uniq.count != list.count    
  end

end
