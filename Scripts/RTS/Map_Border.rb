class Game_Map
  BORDER_WIDTH_X = 4
  BORDER_WIDTH_Y = 4
  
  alias :old_setup_border :setup
  def setup(map_id)
    old_setup_border(map_id)
    
    @map.data.resize(@map.data.xsize + 2 * BORDER_WIDTH_X,
                     @map.data.ysize + 2 * BORDER_WIDTH_Y,
                     @map.data.zsize)
    
    for layer in 0..2
      (@map.height - 1).downto(0) do |y|
        (@map.width - 1).downto(0) do |x|
          @map.data[x + BORDER_WIDTH_X,
                    y + BORDER_WIDTH_Y,
                    layer] = @map.data[x, y, layer]
        end
      end
      
      # clear upper border
      for y in 0..(BORDER_WIDTH_Y - 1)
        for x in 0..(@map.width - 1)
          @map.data[x, y, layer] = 0
        end
      end
      
      # clear left border
      for y in BORDER_WIDTH_Y..(@map.height - 1)
        for x in 0..(BORDER_WIDTH_X - 1)
          @map.data[x, y, layer] = 0
        end
      end
    end
    
    @map.width += 2 * BORDER_WIDTH_X
    @map.height += 2 * BORDER_WIDTH_Y
    
    # move events
    @events.values.each do |event|
      event.moveto(event.x + BORDER_WIDTH_X, event.y + BORDER_WIDTH_Y)
    end
  end
end

class Game_Character
  alias old_passable_border passable?
  def passable?(x, y, d)
    # Get new coordinates
    new_x = x + (d == 6 ? 1 : d == 4 ? -1 : 0)
    new_y = y + (d == 2 ? 1 : d == 8 ? -1 : 0)
    
    if new_x < Game_Map::BORDER_WIDTH_X
      return false
    elsif new_x >= $game_map.width - Game_Map::BORDER_WIDTH_X
      return false
    elsif new_y < Game_Map::BORDER_WIDTH_Y
      return false
    elsif new_y >= $game_map.height - Game_Map::BORDER_WIDTH_Y
      return false
    else
      return old_passable_border(x, y, d)
    end
  end
end
