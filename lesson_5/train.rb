require_relative 'manufacturer.rb'
require_relative 'instance_counter'

class Train
  attr_reader :speed, :wagons, :station_position, :name, :type, :route

  include Manufacturer::InstanceMethods
  include InstanceCounter::InstanceMethods
  extend InstanceCounter::ClassMethods
  
  @@trains = []

  def self.trains
    @@trains
  end
  
  def initialize(number)
    @name_manufacturer = nil
    @type = nil
    @name = number
    @wagons = []
    @speed = 0
    @route = nil
    @station_position = nil
    self.class.trains << self
  end

  def self.find(number)
    @@trains.each do |train|
      if number == train.name
        return train
      end
    end
    return nil
  end  
  
  def current_station
    @station_position 
  end  
  
  def next_station
    @route.list[i_curr_st + 1] if i_curr_st < @route.list.count
  end  

  def prev_station
    @route.list[i_curr_st - 1] if i_curr_st > 0
  end  
  
  def speed_up
    @speed += 10 if @speed < 210  
  end

  def speed_down
    @speed -= 10 if @speed > 10 
  end

  def stop
    @speed = 0 
  end

  def add_wagon(wagon) # wagons_on_station
    @wagons << wagon if @type == wagon.type && @wagons.count < 100
  end

  def unhok_wagon
    @wagons.pop if @wagons.count > 0 && @speed == 0 
  end

  def set_route(route)
    @route = route
    @station_position = @route.list[0]
  end
  
  def move_forward
    @station_position = @route.list[i_curr_st + 1] if i_curr_st < @route.list.count - 1
  end

  def move_backward
    @station_position = @route.list[i_curr_st - 1] if i_curr_st > 0
  end

  private
  def i_curr_st
    @route.list.index @station_position
  end
end
