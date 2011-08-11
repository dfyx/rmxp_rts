# TODO: implement A*

class Game_Character
  
  def route_to(to_x, to_y)
    if to_x == @target_x and to_y == @target_y
      return
    end
    
    @target_x=to_x
    @target_y=to_y
    
    field = calculate_route
    return if field.nil?
    
    tmp_x = field[:x]
    tmp_y = field[:y]
    
    @move_route.repeat = false
    @move_route.list = []
    @move_route_index = 0
    # Clear prelock direction
    @prelock_direction = 0
    # Clear wait count
    @wait_count = 0
    
    
    while field = field[:prev]
      if tmp_x > field[:x]
        if tmp_y > field[:y]
          @move_route.list << RPG::MoveCommand.new(17)
          @move_route.list << RPG::MoveCommand.new(7)
        elsif tmp_y < field[:y]
          @move_route.list << RPG::MoveCommand.new(17)
          @move_route.list << RPG::MoveCommand.new(5)
        else
          @move_route.list << RPG::MoveCommand.new(2)
        end
      elsif tmp_x < field[:x]
        if tmp_y > field[:y]
          @move_route.list << RPG::MoveCommand.new(18)
          @move_route.list << RPG::MoveCommand.new(8)
        elsif tmp_y < field[:y]
          @move_route.list << RPG::MoveCommand.new(18)
          @move_route.list << RPG::MoveCommand.new(6)
        else
          @move_route.list << RPG::MoveCommand.new(3)
        end
      else
        if tmp_y > field[:y]
          @move_route.list << RPG::MoveCommand.new(4)
        elsif tmp_y < field[:y]
          @move_route.list << RPG::MoveCommand.new(1)
        else
          print "Error, standing still!"
        end
      end
      
      tmp_x=field[:x]
      tmp_y=field[:y]
    end
    
    @move_type = 3
    @move_frequency = 6
  end
  
  def calculate_route
    return nil unless passable?(@target_x, @target_y, 0)
    closed_list=[]
    
    open_list = PriorityQueue.new()
    
    new_field = {:x=>@target_x,
                  :y=>@target_y,
                  :cost=>0,
                  :h=>0,
                  :prev=>nil,
                  :priority => 0}
                  
    open_list.push([new_field[:x], new_field[:y]], new_field[:priority], new_field)
    
    until new_field[:x]==@x and new_field[:y]==@y
      new_field = open_list.delete_min[2]

      closed_list<<[new_field[:x],new_field[:y]]
      temp_list=surrounding_fields(new_field[:x],
                                   new_field[:y],
                                   new_field[:cost],
                                   new_field)
      for item in temp_list
        open_list.push([item[:x],item[:y]], item[:priority], item) unless closed_list.include?([item[:x],item[:y]])
      end
    end
    return new_field
  end
  
  def surrounding_fields(x, y,cost,prev)
    result=[]
    
    down = passable_without_self?(x,y,2)
    left = passable_without_self?(x,y,4)
    right = passable_without_self?(x,y,6)
    up = passable_without_self?(x,y,8)
    
    result<<{:x=>x,
            :y=>y+1,
            :cost=>cost+1,
            :h=>heu(@x,@y,x,y+1),
            :prev=>prev} if down
    result<<{:x=>x-1,
            :y=>y,
            :cost=>cost+1,
            :h=>heu(@x,@y,x-1,y),
            :prev=>prev} if left
    result<<{:x=>x+1,
            :y=>y,
            :cost=>cost+1,
            :h=>heu(@x,@y,x+1,y),
            :prev=>prev} if right
    result<<{:x=>x,
            :y=>y-1,
            :cost=>cost+1,
            :h=>heu(@x,@y,x,y-1),
            :prev=>prev} if up
    
    if right and down and passable_without_self?(x+1,y,2) and passable_without_self?(x,y+1,6) 
      result<<{:x=>x+1,
              :y=>y+1,
              :cost=>cost+1.4,
              :h=>heu(@x,@y,x+1,y+1),
              :prev=>prev}
    end
    
    if right and up and passable_without_self?(x+1,y,8) and passable_without_self?(x,y-1,6) 
      result<<{:x=>x+1,
              :y=>y-1,
              :cost=>cost+1.4,
              :h=>heu(@x,@y,x+1,y-1),
              :prev=>prev}
    end

    if left and down and passable_without_self?(x-1,y,2) and passable_without_self?(x,y+1,4) 
      result<<{:x=>x-1,
              :y=>y+1,
              :cost=>cost+1.4,
              :h=>heu(@x,@y,x-1,y+1),
              :prev=>prev}
    end
    
    if left and up and passable_without_self?(x-1,y,8) and passable_without_self?(x,y-1,4) 
      result<<{:x=>x-1,
              :y=>y-1,
              :cost=>cost+1.4,
              :h=>heu(@x,@y,x-1,y-1),
              :prev=>prev}
    end

    result.each do |item|
      item[:priority] = item[:h] + item[:cost]
    end
    
    return result
  end
  
  def heu(x,y,tx,ty)
    dx = x - tx
    dy = y - ty
    return Math.sqrt(dx * dx + dy * dy)
  end
  
  def interact_with(event)
    dist_x = event.x - self.x
    dist_y = event.y - self.y
    
    if moving? or dist_x * dist_x + dist_y * dist_y <= 4
      return
    end
    
    if dist_x < 0
      if dist_y < 0
        move_upper_left
      elsif dist_y > 0
        move_lower_left
      else
        move_left
      end
    elsif dist_x > 0
      if dist_y < 0
        move_upper_right
      elsif dist_y > 0
        move_lower_right
      else
        move_right
      end
    else
      if dist_y < 0
        move_up
      elsif dist_y > 0
        move_down
      end
    end
  end
end

class Game_Character
  def passable_without_self?(x, y, d)
    # Get new coordinates
    new_x = x + (d == 6 ? 1 : d == 4 ? -1 : 0)
    new_y = y + (d == 2 ? 1 : d == 8 ? -1 : 0)

    # If unable to enter move tile in designated direction
    unless $game_map.passable?(new_x, new_y, 10 - d)
      # impassable
      return false
    end
    
    # Loop all events
    for event in $game_map.events.values
      # If event coordinates are consistent with move destination
      if event.x == new_x and event.y == new_y
        # If through is OFF
        unless event.through or self == event
          # If self is event
          if self != $game_player
            # impassable
            return false
          end
          # With self as the player and partner graphic as character
          if event.character_name != ""
            # impassable
            return false
          end
        end
      end
    end

    # passable
    return true
  end
end
