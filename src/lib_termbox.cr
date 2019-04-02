@[Link("termbox")]

lib LibTermbox
  struct Cell
    c : UInt32
    fg, bg : UInt16
  end

  struct EventType : UInt8
    Key    = 1
    Resize = 2
    Mouse  = 3
  end

  struct Event
    type : EventType
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
  fun set_clear_attribute = tb_set_clear_attribute(fg : UInt16, bg : UInt16) : Void

  fun present = tb_present : Void

  fun set_cursor = tb_set_cursor(x : LibC::Int, y : LibC::Int) : Void

  fun put_cell = tb_put_cell(x : LibC::Int, y : LibC::Int, cell : Pointer(Cell)) : Void
  fun change_cell = tb_change_cell(x : LibC::Int, y : LibC::Int, c : UInt32, fg : UInt16, bg : UInt16) : Void

  fun select_input_mode = tb_select_input_mode(mode : LibC::Int) : LibC::Int

  fun select_output_mode = tb_select_output_mode(mode : LibC::Int) : LibC::Int

  fun peek_event = tb_peek_event(event : Pointer(Event), timeout : LibC::Int) : LibC::Int
  fun poll_event = tb_poll_event(event : Pointer(Event)) : LibC::Int
end
