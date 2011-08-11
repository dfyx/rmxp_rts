module Input
  # ermöglicht die Abfrage ob die Maus über einem Picture ist
  # hilfreich für Picture-Menüs
  def self.mouse_over_pic?(id)
    pic = $game_screen.pictures[id]
    return false if pic.nil? or pic.name == ""
    bitmap = RPG::Cache.picture(pic.name)
    return Input.mouse_in_rect?(pic.x, pic.y, bitmap.width, bitmap.height)
  end
  # ermöglicht die Abfrage ob die Maus über einem Event steht
  # hilfreich für AKS
  def self.mouse_over_event?(id)
    if id == 0
      event = $game_player
    else
      event = $game_map.events[id]
    end
    return false if event .nil?
    if event.tile_id > 0
      bitmap = Bitmap.new(32, 32)
      x = event.screen_x - 16
      y = event.screen_y - 32
      w = 32
      h = 32
    else
      bitmap = RPG::Cache.character(event.character_name, 0)
      x = event.screen_x - bitmap.width / 8
      y = event.screen_y - bitmap.height / 4
      w = bitmap.width / 4
      h = bitmap.height / 4
    end
    return Input.mouse_in_rect?(x, y, w, h)
  end
  
  def self.event_under_mouse(allow_player = false)
    if allow_player and mouse_over_event?(0)
      return $game_player
    end
    
    for i in 0..$game_map.events.length
      if mouse_over_event?(i)
        return $game_map.events[i]
      end
    end
    
    return nil
  end
  
  SET_CURSOR_POS = Win32API.new('user32', 'SetCursorPos', %w(i i), 'b')
  CLI_TO_SCR = Win32API.new('user32', 'ClientToScreen', %w(l p), 'i')
  def self.mouse_x=(x)
    set_mouse_pos(x, mouse_y)
  end
  
  def self.mouse_y=(y)
    set_mouse_pos(mouse_x, y)
  end
  
  def self.set_mouse_pos(x, y)
    CURSOR.x = x
    CURSOR.y = y
    point = [x, y].pack("ll")
    CLI_TO_SCR.call(HANDLE, point)
    rel_x, rel_y = point.unpack("ll")
    SET_CURSOR_POS.call(rel_x, rel_y)
  end
end
