class Dynamic_Event < Game_Event
  def initialize(map_id, x, y, name = "")
    event = RPG::Event.new(x, y)
    if $game_map.events.empty?
      event.id = 1
    else
      event.id = $game_map.events.keys.max + 1
    end
    
    event.name = name
    super(map_id, event)
  end
  
  def makepage(type = 0, speed = 3, freq = 3, walkani = true, step = false, lock = false, phase = false, top = false, trigger = 0)
    size = @event.pages.size
    @event.pages.push(RPG::Event::Page.new)
    @event.pages[size].move_type = type
    @event.pages[size].move_speed = speed
    @event.pages[size].move_frequency = freq
    @event.pages[size].walk_anime = walkani
    @event.pages[size].step_anime = step
    @event.pages[size].direction_fix = lock
    @event.pages[size].through = phase
    @event.pages[size].always_on_top = top
    @event.pages[size].trigger = trigger #0=key, 1=htouch, 2=etouch, 3=auto ,4=para
  end
  #--------------------------------------------------------------------------
  def route(page, repeat = true, skippable = false)
    @event.pages[page].move_route.repeat = repeat
    @event.pages[page].move_route.skippable = skippable
  end
  #--------------------------------------------------------------------------
  def movement(page, code = 0, parameters = [])
    lastmove = @event.pages[page].move_route.list.pop
    @event.pages[page].move_route.list.push(RPG::MoveCommand.new(code, parameters))
    @event.pages[page].move_route.list.push(lastmove)
  end
  #--------------------------------------------------------------------------
  def graphic(page, pic = "", tile = 0, hue = 0, dir = 2, pattern = 0, opacity = 255, blend = 0)
    @event.pages[page].graphic.tile_id = tile
    @event.pages[page].graphic.character_name = pic
    @event.pages[page].graphic.character_name
    @event.pages[page].graphic.character_hue = hue
    @event.pages[page].graphic.direction = dir
    @event.pages[page].graphic.pattern = pattern #direction handles row, pattern handles column
    @event.pages[page].graphic.opacity = opacity
    @event.pages[page].graphic.blend_type = blend
  end
  #--------------------------------------------------------------------------
  def add_command(page, code, parameters, indent = 0)
    temp = @event.pages[page].list.pop
    size = @event.pages[page].list.size
    @event.pages[page].list.push(RPG::EventCommand.new)
    @event.pages[page].list[size].code = code
    @event.pages[page].list[size].parameters = parameters
    @event.pages[page].list[size].indent = indent
    @event.pages[page].list.push(temp)
  end
  #--------------------------------------------------------------------------
  def condition(page, s1on = false, s1id = 1, s2on = false, s2id = 1, varon = false, varid = 1, varval = 0, sswon = false, sswval = "A")
    @event.pages[page].condition.switch1_valid = s1on
    @event.pages[page].condition.switch2_valid = s2on
    @event.pages[page].condition.variable_valid = varon
    @event.pages[page].condition.self_switch_valid = sswon
    @event.pages[page].condition.switch1_id = s1id
    @event.pages[page].condition.switch2_id = s2id
    @event.pages[page].condition.variable_id = varid
    @event.pages[page].condition.variable_value = varval
    @event.pages[page].condition.self_switch_ch = sswval
  end
  
  def inject
    $game_map.events[@id] = self
    $game_map.need_refresh = true
    
    if $scene.is_a?(Scene_Map)
      $scene.add_event(self)
    end
  end
  
  def id=(id)
    $game_map.events[id] = self
    $game_map.events.delete @id
    @id = id
    @event.id = id
  end
  
  def transfer_page(event_id, page)
    page = $game_map.events[event_id].event.pages[page]
    @event.pages.push(page.clone)
    $game_map.need_refresh = true
  end
end

class Game_Event
  attr_reader :event
end

class Scene_Map
  def add_event(event)
    @spriteset.add_event(event)
  end
end

class Spriteset_Map
  def add_event(event)
    sprite = Sprite_Character.new(@viewport1, event)
    @character_sprites.push(sprite)
  end
end
