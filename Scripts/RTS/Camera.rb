class Scene_Map
  SCROLL_SPEED = 5
  alias :old_update_camera :update
  def update
    old_update_camera
    
    x, y = Input.relative_mouse_pos
    if Input.press?(Input::VK_MBUTTON)
      if x > @old_x
        $game_map.scroll_right((x - @old_x) * SCROLL_SPEED)
      else
        $game_map.scroll_left((@old_x - x) * SCROLL_SPEED)
      end
      
      if y > @old_y
        $game_map.scroll_down((y - @old_y) * SCROLL_SPEED)
      else
        $game_map.scroll_up((@old_y - y) * SCROLL_SPEED)
      end
      
      Input.set_mouse_pos(@old_x, @old_y)
    else
      width, height = Input.client_size
      if Input.mouse_x > width - 32
        $game_map.scroll_right(32 - (width - Input.mouse_x))
      elsif Input.mouse_x < 32
        $game_map.scroll_left(32 - Input.mouse_x)
      end
      
      if Input.mouse_y > height - 32
        $game_map.scroll_down(32 - (height - Input.mouse_y))
      elsif Input.mouse_y < 32
        $game_map.scroll_up(32 - Input.mouse_y)
      end
      
      @old_x = x
      @old_y = y
    end
  end
end
