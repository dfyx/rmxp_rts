class RTS_Character < Dynamic_Event
  def initialize(map_id, x, y, graphic)
    super(map_id, x, y)
    
    graphic(0, graphic)
    route = RPG::MoveRoute.new()
    move = RPG::MoveCommand.new(10)
    route.repeat = false
    route.skippable = false
    route.list.clear
    route.list.push move
    route.list.push RPG::MoveCommand.new(0)
    makepage(0, 3, 6)
    graphic(1, graphic)
    
    inject
  end
end

class Scene_Map
  alias :old_update_spawn :update
  def update
    old_update_spawn
    
    if Input.trigger?(Input::VK_TAB)
      RTS_Character.new($game_map.map_id, 5, 5, "022-Hunter03")
    end
  end
end
