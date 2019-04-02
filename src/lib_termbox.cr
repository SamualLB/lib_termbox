@[Link("termbox")]

lib LibTermbox
  struct Cell
    c : UInt32
    fg, bg : UInt16
  end

  struct Event
    type : UInt8
    mod : UInt8
    key : UInt16
    ch : UInt32
    w : Int32
    h : Int32
    x : Int32
    y : Int32
  end

  fun init = tb_init : LibC::Int
  fun shutdown = tb_shutdown : Void

  fun width = tb_width : LibC::Int
  fun height = tb_height : LibC::Int

  fun clear = tb_clear : LibC::Int
  fun set_clear_attributes = tb_set_clear_attributes(fg : UInt16, bg : UInt16) : Void

  fun present = tb_present : Void

  fun set_cursor = tb_set_cursor(x : LibC::Int, y : LibC::Int) : Void

  fun put_cell = tb_put_cell(x : LibC::Int, y : LibC::Int, cell : Pointer(Cell)) : Void
  fun change_cell = tb_change_cell(x : LibC::Int, y : LibC::Int, c : UInt32, fg : UInt16, bg : UInt16) : Void

  fun select_input_mode = tb_select_input_mode(mode : LibC::Int) : LibC::Int

  fun select_output_mode = tb_select_output_mode(mode : LibC::Int) : LibC::Int

  fun peek_event = tb_peek_event(event : Pointer(Event), timeout : LibC::Int) : LibC::Int
  fun poll_event = tb_poll_event(event : Pointer(Event)) : LibC::Int

  enum Key : UInt16
    F1 = 0xffff-0
    F2 = 0xffff-1
    F3 = 0xffff-2
    F4 = 0xffff-3
    F5 = 0xffff-4
    F6 = 0xffff-5
    F7 = 0xffff-6
    F8 = 0xffff-7
    F9 = 0xffff-8
    F10 = 0xffff-9
    F11 = 0xffff-10
    F12 = 0xffff-11
    Insert = 0xffff-12
    Delete = 0xffff-13
    Home = 0xffff-14
    End = 0xffff-15
    PageUp = 0xffff-16
    PageDowm = 0xffff-17
    ArrowUp = 0xffff-18
    ArrowDown = 0xffff-19
    ArrowLeft = 0xffff-20
    ArrowRight = 0xffff-21
    MouseLeft = 0xffff-22
    MouseRight = 0xffff-23
    MouseMiddle = 0xffff-24
    MouseRelease = 0xffff-25
    MouseWheelUp = 0xffff-26
    MouseWheelDown = 0xffff-27

    CtrlTilde = 0x00
    Ctrl2 = 0x00 # Clash with CtrlTilde
    CtrlA = 0x01
    CtrlB = 0x02
    CtrlC = 0x03
    CtrlD = 0x04
    CtrlE = 0x05
    CtrlF = 0x06
    CtrlG = 0x07
    Backspace = 0x08
    CtrlH = 0x08 # Clash with Backspace
    Tab = 0x09
    CtrlI = 0x09 # Clash with Tab
    CtrlJ = 0x0A
    CtrlK = 0x0B
    CtrlL = 0x0C
    Enter = 0x0D
    CtrlM = 0x0D # Clash with Enter
    CtrlN = 0x0E
    CtrlO = 0x0F
    CtrlP = 0x10
    CtrlQ = 0x11
    CtrlR = 0x12
    CtrlS = 0x13
    CtrlT = 0x14
    CtrlU = 0x15
    CtrlV = 0x16
    CtrlW = 0x17
    CtrlX = 0x18
    CtrlY = 0x19
    CtrlZ = 0x1A
    Escape = 0x1B
    CtrlLeftSquareBracket = 0x1B # Clash with Escape
    Ctrl3 = 0x1B # Clash with Escape
    Ctrl4 = 0x1C
    CtrlBackslash = 0x1C # Clash with Ctrl4
    Ctrl5 = 0x1D
    CtrlRightSquareBracket = 0x1D # Clash with Ctrl5
    Ctrl6 = 0x1E
    Ctrl7 = 0x1F
    CtrlSlash = 0x1F # Clash with Ctrl7
    CtrlUnderscore = 0x1F # Clash with Ctrl7
    Space = 0x20
    Backspace2 = 0x7F
    Ctrl8 = 0x7F # Clash with Backspace2
  end

  enum Modifier : UInt8
    Alt = 0x01
    Motion = 0x02
  end

  enum Color : UInt16
    Default = 0x00
    Black = 0x01
    Red = 0x02
    Green = 0x03
    Yellow = 0x04
    Blue = 0x05
    Magenta = 0x06
    Cyan = 0x07
    White = 0x08
  end

  enum Attribute : UInt16
    Bold = 0x0100
    Underline = 0x0200
    Reverse = 0x0400
  end

  enum Event : UInt8
    Key = 1
    Resize = 2
    Mouse = 3
  end

  enum Error : LibC::Int
    UnsupportedTerminal = -1
    FailedToOpenTTY = -2
    PipeTrapError = -3
  end

  CURSOR_HIDE = -1 : LibC::Int

  enum InputMode : LibC::Int
    Current = 0
    Escape = 1
    Alt = 2
    Mouse = 4
  end

  enum OutputMode : LibC::Int
    Current = 0
    Normal = 1
    Color256 = 2
    Color216 = 3
    Grayscape = 4
  end
end
