class Scene_Map
  alias :old_update_selection :update
  def update
    old_update_selection
    
    @selected_events ||= []
    
    # Get event under mouse (needed for lots of things
    event = Input.event_under_mouse
    
    # Select units
    if not event.nil? and Input.trigger?(Input::VK_LBUTTON)
      unless Input.press?(Input::VK_CONTROL)
        @selected_events.each do |e|
          e.deselect
        end
        @selected_events = []
      end
      
      if @selected_events.include?(event)
        @selected_events.delete(event)
        event.deselect
      else
        @selected_events << event
        event.select
      end
      
      @singel_selection = true
    elsif Input.press?(Input::VK_LBUTTON) and not @singel_selection
      unless @show_selection_box
        @selection_x0 = $game_map.display_x / 4 + Input.mouse_x
        @selection_y0 = $game_map.display_y / 4 + Input.mouse_y
        @show_selection_box = true
      else
        @selection_x1 = $game_map.display_x / 4 + Input.mouse_x
        @selection_y1 = $game_map.display_y / 4 + Input.mouse_y
        
        unless @selection_sprite.nil?
          @selection_sprite.bitmap.dispose
          @selection_sprite.dispose
          @selection_sprite = nil
        end
        
        @selection_sprite = Sprite.new
        selection_bitmap = Bitmap.new((@selection_x0-@selection_x1).abs+1,
                                      (@selection_y0-@selection_y1).abs+1)
                                      
        selection_bitmap.fill_rect(0, 0,
                                   selection_bitmap.width,
                                   selection_bitmap.height,
                                   Color.new(255, 255, 255, 128))
        selection_bitmap.fill_rect(1, 1,
                                   selection_bitmap.width - 2,
                                   selection_bitmap.height - 2,
                                   Color.new(255, 255, 255, 64))
        
        @selection_sprite.bitmap = selection_bitmap
        
        @selection_sprite.x = @selection_x0
        @selection_sprite.x = @selection_x1 if @selection_x1 < @selection_x0
        @selection_sprite.x = @selection_sprite.x - ($game_map.display_x/4)
        @selection_sprite.y = @selection_y0
        @selection_sprite.y = @selection_y1 if @selection_y1 < @selection_y0
        @selection_sprite.y = @selection_sprite.y - ($game_map.display_y/4)
        @selection_sprite.z = 0.5
        
      end
    elsif @show_selection_box
      unless Input.press?(Input::VK_CONTROL)
        @selected_events.each do |e|
          e.deselect
        end
        @selected_events = []
      end
      
      unless @selection_sprite.nil?
        
        #add events to selection
        for i in 1..$game_map.events.length
          if $game_map.events[i].screen_x.between?(@selection_sprite.x-1,
                                                   @selection_sprite.x+(@selection_x0-@selection_x1).abs+1) and
             $game_map.events[i].screen_y.between?(@selection_sprite.y+16,
                                                   @selection_sprite.y+(@selection_y0-@selection_y1).abs+18)
            #if @selected_events.include?($game_map.events[i])
            #  @selected_events.delete($game_map.events[i])
            #  $game_map.events[i].deselect
            #else
              @selected_events << $game_map.events[i]
              $game_map.events[i].select
            #end
          end
        end
        
        #rahmen loeschen
        @selection_sprite.bitmap.dispose
        @selection_sprite.dispose
        @selection_sprite = nil
        @show_selection_box = false
      end
      
      
    elsif not Input.press?(Input::VK_LBUTTON)
      @singel_selection = false
    end
    
    # Command units
    if Input.press?(Input::VK_RBUTTON)
      x = ($game_map.display_x / 4 + Input.mouse_x) / 32
      y = ($game_map.display_y / 4 + Input.mouse_y) / 32
      
      if event.nil?
        @selected_events.each do |e|
          #$path_finding.setup_event(e.id, false)
          #$path_finding.add_paths_event(e.id, x, y)
          #$path_finding.start_event(e.id)
          #e.move_type = 3
          #e.move_frequency = 6
          e.route_to(x, y)
        end
      else
        @selected_events.each {|e| e.interact_with(event)}
      end
    end
  end
end

class Game_Character
  attr_accessor :move_type
  attr_accessor :move_frequency
  
  def select
    if @selection_sprite.nil?
      @selection_sprite = Sprite.new
      character_bitmap = RPG::Cache.character(character_name, 0)
      selection_bitmap = Bitmap.new(character_bitmap.width / 4 + 4,
                                    character_bitmap.height / 4 + 4)
      selection_bitmap.fill_rect(0, 0,
                                 selection_bitmap.width,
                                 selection_bitmap.height,
                                 Color.new(255, 255, 255, 128))
      selection_bitmap.fill_rect(1, 1,
                                 selection_bitmap.width - 2,
                                 selection_bitmap.height - 2,
                                 Color.new(255, 255, 255, 64))
      @selection_sprite.bitmap = selection_bitmap
      
      @selection_sprite.ox = @selection_sprite.bitmap.width / 2
      @selection_sprite.oy = @selection_sprite.bitmap.height - 2
      
      @selection_sprite.x = screen_x
      @selection_sprite.y = screen_y
      @selection_sprite.z = 0.5
    end
    
    @selected = true
  end
  
  def deselect
    unless @selection_sprite.nil?
      @selection_sprite.bitmap.dispose
      @selection_sprite.dispose
      @selection_sprite = nil
    end
    @selected = false
  end
  
  alias old_update_selection update
  def update
    old_update_selection
    
    unless @selection_sprite.nil?
      @selection_sprite.x = screen_x
      @selection_sprite.y = screen_y
    end
  end
end
