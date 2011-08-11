#==============================================================================
# ** Input (Tastatur- / Maus-Script) Version 1.0.2
#
#----------------------- Scripted by: TheWhiteShadow --------------------------
#
#------------------------------------------------------------------------------
# Dies ist größtenteils ein Edit von derulas "Genocide_Input"-Script
# Link: http://www.rpga.info/forum/showthread.php?t=48395
# Bei Benutzung oder Edit bitte ebenfalls in den Credits erwähnen
#------------------------------------------------------------------------------
# Dieses Script ermöglicht die Benutzung fast aller Eingabetasten und der Maus.
# Die Aktivierung erfolgt vollautomatisch bei Einbindung des Scripts.
#
# Festlegen eines Cursors:
# Rufe "input.set_cursor(source, ox = 0, oy = 0)" auf
# source:  Kann ein Bild sein oder eine Datei im Picutre-Ordner sein
# ox / oy: Offset für das Bild (Standart ist die linke obere Ecke)
#
# Deaktivieren der Maus:
# Setze "MOUSE_ENABLED" auf false.
#==============================================================================

module Input
  # (De)Aktiviert die Maus
  MOUSE_ENABLED = true
  # (De)Aktiviert die Maker-Interne Tastenbelegung
  CUSTOM_CONTROLS = true
  
  # List generated from http://msdn.microsoft.com/en-us/library/ms927178.aspx
  VK_LBUTTON = "\001"           # Left mouse button
  VK_RBUTTON = "\002"           # Right mouse button
  VK_CANCEL = "\003"            # Control-break processing
  VK_MBUTTON = "\004"           # Middle mouse button on a three-button mouse
  VK_BACK = "\010"              # BACKSPACE key
  VK_TAB = "\011"               # TAB key
  VK_CLEAR = "\014"             # CLEAR key
  VK_RETURN = "\015"            # ENTER key
  VK_SHIFT = "\020"             # SHIFT key
  VK_CONTROL = "\021"           # CTRL key
  VK_MENU = "\022"              # ALT key
  VK_PAUSE = "\023"             # PAUSE key
  VK_CAPITAL = "\024"           # CAPS LOCK key
  VK_ESCAPE = "\033"            # ESC key
  VK_SPACE = "\040"             # SPACEBAR
  VK_PRIOR = "\041"             # PAGE UP key
  VK_NEXT = "\042"              # PAGE DOWN key
  VK_END = "\043"               # END key
  VK_HOME = "\044"              # HOME key
  VK_LEFT = "\045"              # LEFT ARROW key
  VK_UP = "\046"                # UP ARROW key
  VK_RIGHT = "\047"             # RIGHT ARROW key
  VK_DOWN = "\050"              # DOWN ARROW key
  VK_SELECT = "\051"            # SELECT key
  VK_EXECUTE = "\053"           # EXECUTE key
  VK_SNAPSHOT = "\054"          # PRINT SCREEN key
  VK_INSERT = "\055"            # INS key
  VK_DELETE = "\056"            # DEL key
  VK_HELP = "\057"              # HELP key
  VK_LWIN = "\133"              # Left Windows key on a Microsoft Natural Keyboard
  VK_RWIN = "\134"              # Right Windows key on a Microsoft Natural Keyboard
  VK_APPS = "\135"              # Applications key on a Microsoft Natural Keyboard
  VK_NUMPAD0 = "\140"           # Numeric keypad 0 key
  VK_NUMPAD1 = "\141"           # Numeric keypad 1 key
  VK_NUMPAD2 = "\142"           # Numeric keypad 2 key
  VK_NUMPAD3 = "\143"           # Numeric keypad 3 key
  VK_NUMPAD4 = "\144"           # Numeric keypad 4 key
  VK_NUMPAD5 = "\145"           # Numeric keypad 5 key
  VK_NUMPAD6 = "\146"           # Numeric keypad 6 key
  VK_NUMPAD7 = "\147"           # Numeric keypad 7 key
  VK_NUMPAD8 = "\150"           # Numeric keypad 8 key
  VK_NUMPAD9 = "\151"           # Numeric keypad 9 key
  VK_MULTIPLY = "\152"          # Multiply key
  VK_ADD = "\153"               # Add key
  VK_SEPARATOR = "\154"         # Separator key
  VK_SUBTRACT = "\155"          # Subtract key
  VK_DECIMAL = "\156"           # Decimal key
  VK_DIVIDE = "\157"            # Divide key
  VK_F1 = "\160"                # F1 key
  VK_F2 = "\161"                # F2 key
  VK_F3 = "\162"                # F3 key
  VK_F4 = "\163"                # F4 key
  VK_F5 = "\164"                # F5 key
  VK_F6 = "\165"                # F6 key
  VK_F7 = "\166"                # F7 key
  VK_F8 = "\167"                # F8 key
  VK_F9 = "\170"                # F9 key
  VK_F10 = "\171"               # F10 key
  VK_F11 = "\172"               # F11 key
  VK_F12 = "\173"               # F12 key
  VK_F13 = "\174"               # F13 key
  VK_F14 = "\175"               # F14 key
  VK_F15 = "\176"               # F15 key
  VK_F16 = "\177"               # F16 key
  VK_F17 = "\200"               # F17 key
  VK_F18 = "\201"               # F18 key
  VK_F19 = "\202"               # F19 key
  VK_F20 = "\203"               # F20 key
  VK_F21 = "\204"               # F21 key
  VK_F22 = "\205"               # F22 key
  VK_F23 = "\206"               # F23 key
  VK_F24 = "\207"               # F24 key
  VK_NUMLOCK = "\220"           # NUM LOCK key
  VK_SCROLL = "\221"            # SCROLL LOCK key
  VK_LSHIFT = "\240"            # Left SHIFT
  VK_RSHIFT = "\241"            # Right SHIFT
  VK_LCONTROL = "\242"          # Left CTRL
  VK_RCONTROL = "\243"          # Right CTRL
  VK_LMENU = "\244"             # Left ALT
  VK_RMENU = "\245"             # Right ALT
  VK_ATTN = "\366"              # ATTN key
  VK_CRSEL = "\367"             # CRSEL key
  VK_EXSEL = "\370"             # EXSEL key
  VK_EREOF = "\371"             # Erase EOF key
  VK_PLAY = "\372"              # PLAY key
  VK_ZOOM = "\373"              # ZOOM key
  VK_PA1 = "\375"               # PA1 key
  VK_OEM_1 = "\272"             # ";:" for US
  VK_OEM_PLUS = "\273"          # "+" any country/region
  VK_OEM_COMMA = "\274"         # "," any country/region
  VK_OEM_MINUS = "\275"         # "-" any country/region
  VK_OEM_PERIOD = "\276"        # "." any country/region
  VK_OEM_2 = "\277"             # "/?" for US
  VK_OEM_3 = "\300"             # "`~" for US
  VK_OEM_4 = "\333"             # "[{" for US
  VK_OEM_5 = "\334"             # "|" for US
  VK_OEM_6 = "\335"             # "]}" for US
  VK_OEM_7 = "\336"             # "'"" for US
  VK_OEM_AX = "\341"            # AX key on Japanese AX keyboard
  VK_OEM_102 = "\342"           # "<>" or "|" on RT 102-key keyboard
  VK_DBE_ALPHANUMERIC = "\360"  # Changes the mode to alphanumeric.
  VK_DBE_KATAKANA = "\361"      # Changes the mode to Katakana.
  VK_DBE_HIRAGANA = "\362"      # Changes the mode to Hiragana.
  VK_DBE_SBCSCHAR = "\363"      # Changes the mode to single-byte characters.
  VK_DBE_DBCSCHAR = "\364"      # Changes the mode to double-byte characters.
  VK_DBE_ROMAN = "\365"         # Changes the mode to Roman characters.
  VK_DBE_NOROMAN = "\366"       # Changes the mode to non-Roman characters.
  VK_DBE_ENTERWORDREGISTERMODE = "\367" # Activates the word registration dialog box.
  VK_DBE_ENTERIMECONFIGMODE = "\370" # Activates a dialog box for setting up an IME environment.
  VK_DBE_FLUSHSTRING = "\371"   # Deletes the undetermined string without determining it.
  VK_DBE_CODEINPUT = "\372"     # Changes the mode to code input.
  VK_DBE_NOCODEINPUT = "\373"   # Changes the mode to no-code input.
  
  # Alte Standard-Input-Tasten in Hash speichern
  KEYS = {
    # DOWN LEFT RIGHT UP
    Input::DOWN => VK_DOWN,
    Input::LEFT => VK_LEFT,
    Input::RIGHT => VK_RIGHT,
    Input::UP => VK_UP,
    # A B C X Y Z L R
    Input::A => [],
    Input::B => [],
    Input::C => [],
    Input::X => [],
    Input::Y => [],
    Input::Z => [],
    Input::L => [VK_PRIOR],
    Input::R => [VK_NEXT],
    # SHIFT CTRL ALT
    Input::SHIFT => VK_SHIFT,
    Input::CTRL => VK_CONTROL,
    Input::ALT => VK_MENU,
    # F5 F6 F7 F8 F9
    Input::F5 => VK_F5,
    Input::F6 => VK_F6,
    Input::F7 => VK_F7,
    Input::F8 => VK_F8,
    Input::F9 => VK_F9
  }
  
  # Windows-APIs
  KEY_STATE   = Win32API.new("user32","GetAsyncKeyState",['i'],'i')
  # Tastaturkonfiguration auslesen
  if CUSTOM_CONTROLS
    begin
      ( Win32API.new("Shlwapi", "SHRegGetValue", ["L", "P", "P", "L", "P", "P", "P"], "l").call(
        1 - (1 << 31), "Software\\Enterbrain\\RGSS", "ButtonAssign", 8, " " * 4, data = " " * 25, [25].pack("L")) )
      data = data.unpack("C" * 25)[10..-1]
    rescue
      # Standardwerte falls aus Registry nicht geladen werden konnte
      data = [13, 13, 12, 12, 11, 11, 12, 13, 0, 0, 14, 15, 16, 17, 18]
    end
    codes = [VK_SPACE, VK_RETURN, VK_ESCAPE, VK_NUMPAD0, VK_SHIFT,
             "Z", "X", "C", "V", "B", "A", "S", "D", "Q", "W"]
    (0..14).each {|i| KEYS[data[i]] << codes[i] if KEYS[data[i]].is_a? Array }
  end
  
  if MOUSE_ENABLED
    CURSOR_POS  = Win32API.new('user32', 'GetCursorPos', 'p', 'i')
    SCR_TO_CLI  = Win32API.new('user32', 'ScreenToClient', %w(l p), 'i')
    CLIENT_RECT = Win32API.new('user32', 'GetClientRect', %w(l p), 'i')
    READ_INI    = Win32API.new('kernel32', 'GetPrivateProfileStringA', %w(p p p p l p), 'l')
    FIND_WINDOW = Win32API.new('user32', 'FindWindow', %w(p p), 'l')
    SHOW_CURSOR = Win32API.new("user32", "ShowCursor", ['i'], 'i')
  
    read = Win32API.new("kernel32", "GetPrivateProfileString", ["P", "P", "P", "P", "i", "P"], "i").call("Game", "Title", "", title = " " * 100, 100, "./Game.ini")
    HANDLE = Win32API.new("user32", "FindWindow", ["p", "p"], "i").call("RGSS Player", title[0, read])
  
    CURSOR = Sprite.new # erstelle den Cursor
    CURSOR.z = 10000    # setze den Cursor vor allem anderen
    # definiere den default_cursor, wenn vorhanden
    if FileTest.exist?("Graphics/Pictures/cursor.png")
      CURSOR.bitmap = RPG::Cache.picture("cursor")
      SHOW_CURSOR.call(0)
    end
    @@events = []
    # (De)Aktiviere Mausfunktionen auf der Map
    @@mouse_active = true
    attr_accessor :mouse_active
  
    # Gibt die X-Koordinate der Maus zurück
    def self.mouse_x
      CURSOR.x
    end
  
    # Gibt die Y-Koordinate der Maus zurück
    def self.mouse_y
      CURSOR.y
    end
  
    # Stellt fest, ob sich die Maus innerhalb von Rect x bzw. Rect(x, y, w, h) aufhält
    def self.mouse_in_rect?(x, y = nil, w = nil, h = nil)
      if y == nil and w == nil and h == nil
        mouse_in_rect?(x.x, x.y, x.width, x.height)
      else
        (x <= CURSOR.x and CURSOR.x <= x + w and
         y <= CURSOR.y and CURSOR.y <= y + h)
      end
    end
    
    # setze die Sichtbarkeit des Windows-Cursors
    def self.show_cursor(val)
      if CURSOR.visible == val
        CURSOR.visible = !val
        SHOW_CURSOR.call(val ? 1 : 0)
      end
    end
    
    # Definiert ein Bitmap für den Cursor
    def self.set_cursor(source, ox = 0, oy = 0)
      source = RPG::Cache.picture(source) if source.is_a?(String)
      result = 
      if source.is_a?(Bitmap)
        CURSOR.bitmap = source
        CURSOR.ox = ox
        CURSOR.oy = oy
        true
      end
      SHOW_CURSOR.call(!result ? 1 : 0)
      result
    end
    
    # steuert sichtbarkeit
    def self.mouse_pos
      x, y = self.relative_mouse_pos
      width, height = self.client_size
      if (x >= 0 and x <= width and y >= 0 and y <= height) and
          (Window_Selectable.activ_window or @@mouse_active)
        show_cursor(CURSOR.bitmap.nil?)
      else
        show_cursor(true)
      end
      return x, y
    end
    
    # fügt ein MausEvent zur Liste hinzu
    def self.add_event(event)
      @@events.push(event)
    end
    
    # entfernt ein oder alle MausEvents
    def self.delete_event(event)
      if event == :all
        @@events.clear
      else
        @@events.delete(event)
      end
    end
    
    # gibt die relative Mausposition zurück
    def self.relative_mouse_pos
      point = " " * 8 # 2 long
      CURSOR_POS.call(point)         # absolute Position
      SCR_TO_CLI.call(HANDLE, point) # relative Position
      return point.unpack("ll")
    end

    # gibt die Fenstergröße zurück
    def self.client_size
      rect = " " * 16 # 4 long
      CLIENT_RECT.call(HANDLE, rect)
      return rect.unpack('l4')[2..3]
    end
  end
  # end Mouse
  
  def self.update
    if MOUSE_ENABLED
      if Window_Selectable.activ_window or @@mouse_active
        x, y = mouse_pos
        CURSOR.x, CURSOR.y = x, y
        # Suche nach Maus-Events
        if $scene.is_a?(Scene_Map) and not $game_system.map_interpreter.running?
          for event in @@events
            if mouse_in_rect?(event) and trigger?(event.button)
              common_event = $data_common_events[event.event_id]
              $game_system.map_interpreter.setup(common_event.list, 0)
            end
          end
        end
      else
        CURSOR.x, CURSOR.y = 0, 0
        CURSOR.visible = false
      end
    end
    # Tastenmanagment
    @@pressed_keys.each_key do |key|
      if not key_down?(key)
        @@pressed_keys.delete(key)
      else
        @@pressed_keys[key] += 1
      end
    end
  end

  # speichert die gedrückten tasten
  @@pressed_keys = {}
  
  def self.press?(key)
    @@pressed_keys.include?(key) or trigger?(key)
  end
  
  def self.trigger?(key)
    # spezielle Mausabfrage
    if Window_Selectable.activ_window
      # Simuliere Eingabe durch linken Mausklick 
      if (key == C or key == VK_RETURN) and trigger?(VK_LBUTTON) and
         Window_Selectable.current_button
        return true
      end
      # Simuliere Escape durch rechten Mausklick
      if (key == B or key == VK_ESCAPE) and trigger?(VK_RBUTTON)
        return true
      end
    end
    # normale Tasterturabfrage
    result = (key_down?(key) and
      (not @@pressed_keys.include?(key) or @@pressed_keys[key] == 1))
    @@pressed_keys[key] = 1 if result
    return result
  end

  def self.repeat?(key)
    unless @@pressed_keys.include?(key)
      trigger?(key)
    else
      @@pressed_keys[key] == 1 or
        (@@pressed_keys[key] >= 15 and @@pressed_keys[key] % 3 == 0)
    end
  end
  
  def self.dir4
    press?(DOWN)?2:(press?(LEFT)?4:(press?(RIGHT)?6:(press?(UP)?8:0)))
  end

  def self.dir8
    case self.dir4
    when 2
      press?(LEFT)?1:(press?(RIGHT)?3:2)
    when 4
      press?(UP)?7:(press?(DOWN)?1:4)
    when 6
      press?(UP)?9:(press?(UP)?3:6)
    when 8
      press?(LEFT)?7:(press?(RIGHT)?9:8)
    else
      0
    end
  end
  
  def self.key_down?(key)
    if key.is_a? Integer
      if KEYS[key].is_a? Array
        KEYS[key].each { |k| return true if key_down?(k) }
        return false
      else
        key = KEYS[key]
      end
    end
    (KEY_STATE.call(key[0]) & -(1 << 15)) != 0
  end

  # Cursor zeigen, wenn Message angezeigt wird
  module ::Kernel
    alias :old_print :print
    def print(*args)
      Input.show_cursor(true)
      old_print(*args)
    end
    alias :old_p :p
    def p(*args)
      Input.show_cursor(true)
      old_p(*args)
    end
  end
end

#---------------------------------------------------------------------------
# Klasse für Mausevents
#---------------------------------------------------------------------------
class MouseEvent < Rect
  attr_accessor :event_id
  attr_accessor :button
  def initialize(x, y, width, height, event_id, button = Input::VK_LBUTTON)
    super(x, y, width, height)
    @event_id = event_id
    @button = button
    Input.add_event(self)
  end
  
  def dispose
    Input.delete_event(self)
  end
end

#==============================================================================
# ** Maus-Erweiterung
#
#----------------------- Scripted by: TheWhiteShadow --------------------------
#
#------------------------------------------------------------------------------
# Diese Erweiterung ermöglicht die Benutzung der Maus für alle Fenster vom Typ:
# "Window_Selectable" oder Erben von dieser.
# Außerdem noch im Standart Save-Menü.
# 
# Ursprünglich erstellt und optimiert für mein eigenes Mausscript.
# Wenn ein anderes Mausscript verwendet wird muss es eine Funktion:
# "mouse_in_rect?(rect)" im Modul "Input" besitzen bzw. hier durch das Äquivalet
# dazu  ersetzt werden und eine Simulation der Eingabetaste bei gesetztem
# "@@activ_window" und "@@current_butten" beim drücken einer Maustaste erfolgen.
# Außerdem muss die Konstante "MOUSE_ENABLED" = true.
#
# Note: Kein Support von mir für fremde Scripte!
#==============================================================================
class Window_Selectable
  attr_reader :buttons    # Regionen der Schaltflächen
  
  @@activ_window = nil    # Aktives Fenster
  @@current_butten = nil  # Aktive Schaltläche
  
  # Zugriffsfunktionen
  def self.activ_window=(value)
    @@activ_window = value
  end
  def self.current_button=(value)
    @@current_butten = value
  end
  def self.activ_window
    @@activ_window
  end
  def self.current_button
    @@current_butten
  end
  
  # Alias-Liste für Window_Selectable
  alias :old_dispose :dispose
  alias :old_update :update
  alias :old_active= :active=
  alias :old_x= :x=
  alias :old_y= :y=
  
  def dispose
    self.active = false
    old_dispose
  end
   
  def update
    # Wenn keine Buttons vorhanden sind oder nicht aktuell, lege sie fest
    # um aktuelle Buttons zu erhalten muss der Code in der update-funktion sein.
    if Input::MOUSE_ENABLED and (@buttons.nil? or @buttons.size != @item_max)
      @buttons = []
      temp_index = @index
      @index = 0
      for i in 0..@item_max - 1
        update_cursor_rect
        rect = self.cursor_rect.clone
        rect.x += self.x + self.ox + 16
        rect.y += self.y + self.oy + 16
        # dieses Problem hat nur die Messagebox
        rect.width = self.width - 32 if rect.width == 0
        @buttons.push(rect)
        @index += 1
      end
      @index = temp_index
    end
    self.old_update
    @@activ_window = self if self.active
    return unless @buttons and Window_Selectable.activ_window == self
    # Wenn das Fenster aktiv ist prüfe, ob die Maus über einem Button ist
    for i in 0..@buttons.size - 1
      rect = Rect.new(@buttons[i].x - self.ox, @buttons[i].y - self.oy,
                      @buttons[i].width, @buttons[i].height)
      if Input.mouse_in_rect?(rect)
        @@current_butten = @buttons[i]
        @index = i
        return
      end
    end
    @@current_butten = nil
  end
  
  # zum aktualisieren der Klassenvariablen
  def active=(value)
    self.old_active = value
    if value
      @@activ_window = self
    elsif @@activ_window == self
      @@activ_window = nil
      @@current_butten = nil
    end
  end
  
  # zum aktualisieren der Button-Positionen
  def x=(value)
    diff = value - self.x
    self.old_x = value
    return unless (Input::MOUSE_ENABLED and @buttons)
    for button in @buttons
      button.x += diff
    end
  end
  
  def y=(value)
    diff = value - self.y
    self.old_y = value
    return unless (Input::MOUSE_ENABLED and @buttons)
    for button in @buttons
      button.y += diff
    end
  end
end

# Da beim Speichern die Auswahl fensterübergreifend ist, müssen die selben
# Funktion auf die Klasse "Scene_File" übertragen werden.
class Scene_File
  attr_reader :buttons    # Regionen der Schaltflächen
  
  alias :old_update :update
  def update
    # sieht im update zwar doof aus, ist aber eine Ausnahme und funktioniert^^
    Window_Selectable.activ_window = self
    # Wenn keine Buttons vorhanden sind, lege sie fest
    if Input::MOUSE_ENABLED and not @buttons
      @buttons = []
      for i in 0..@savefile_windows.size - 1
        win = @savefile_windows[i]
        rect = Rect.new(win.x, win.y + i / 4 * 416, win.width, win.height)
        @buttons.push(rect)
      end
    end
    self.old_update
    return if @buttons.nil?
    # note: Wenn du ein mehrseitiges Save-Menü hast, sezte "@site" über update
    # und lösche diese Zeile. (Bisher kein kompatibles Save-Menü vorhanden)
    @site = 0 
    # Wenn das Fenster aktiv ist prüfe, ob die Maus über einem Button ist
    for i in 0..@buttons.size - 1
      rect = Rect.new(@buttons[i].x, @buttons[i].y - @site * 416,
                      @buttons[i].width, @buttons[i].height)
      if Input.mouse_in_rect?(rect)
        @savefile_windows[@file_index].selected = false
        @file_index = i
        @savefile_windows[@file_index].selected = true
        Window_Selectable.current_button = @buttons[i]
        return
      end
    end
    Window_Selectable.current_button = nil
  end
end

# Erweiterung für die Mausbenutzung bei Spieler und Gegnerwahl im Kapf
class Scene_Battle
   # Alias-Liste für Scene_Battle
  alias :old_start_actor_select :start_actor_select
  alias :old_start_enemy_select :start_enemy_select
  alias :old_update_phase3_actor_select :update_phase3_actor_select
  alias :old_update_phase3_enemy_select :update_phase3_enemy_select

  def start_actor_select
    old_start_actor_select
    Window_Selectable.activ_window = self
    @buttons = []
    for actor in $game_party.actors
      bitmap = RPG::Cache.battler(actor.character_name, 0)
      x = actor.screen_x - bitmap.width / 2
      y = actor.screen_y - bitmap.height
      rect = Rect.new(x, y, bitmap.width, bitmap.height)
      @buttons.push(rect)
    end
  end
  
  def start_enemy_select
    old_start_enemy_select
    Window_Selectable.activ_window = self
    @buttons = []
    for enemy in $game_troop.enemies
      file = $data_enemies[enemy.id].battler_name
      bitmap = RPG::Cache.battler(file, 0)
      x = enemy.screen_x - bitmap.width / 2
      y = enemy.screen_y - bitmap.height
      rect = Rect.new(x, y, bitmap.width, bitmap.height)
      @buttons.push(rect)
    end
  end
  
  def update_phase3_actor_select
    old_update_phase3_actor_select
    return unless @actor_arrow
    for i in 0..@buttons.size - 1
      if Input.mouse_in_rect?(@buttons[i])
        @actor_arrow.index = i
        Window_Selectable.current_button = @buttons[i]
        return
      end
    end
    Window_Selectable.current_button = nil
  end
  
  def update_phase3_enemy_select
    old_update_phase3_enemy_select
    return unless @enemy_arrow
    for i in 0..@buttons.size - 1
      if Input.mouse_in_rect?(@buttons[i])
        @enemy_arrow.index = i
        Window_Selectable.current_button = @buttons[i]
        return
      end
    end
    Window_Selectable.current_button = nil
  end
end

class Interpreter
  # ermöglicht die Abfrage ob die Maus über einem Picture ist
  # hilfreich für Picture-Menüs
  def mouse_over_pic?(id)
    pic = $game_screen.pictures[id]
    return false if pic.nil? or pic.name == ""
    bitmap = RPG::Cache.picture(pic.name)
    return Input.mouse_in_rect?(pic.x, pic.y, bitmap.width, bitmap.height)
  end
  # ermöglicht die Abfrage ob die Maus über einem Event steht
  # hilfreich für AKS
  def mouse_over_event?(id)
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
end
