require "./../src/lib_termbox"

# Writing to STDERR won't work before `LibTermbox.shutdown`
error : Exception? = nil

begin
  errno = LibTermbox.init
  raise "Error: #{LibTermbox::Error.new(errno)}" if errno < 0
  
  LibTermbox.change_cell( 0, 0, 'P'.ord.to_u32, 0_u32, 0_u32)
  LibTermbox.change_cell( 1, 0, 'r'.ord.to_u32, 0_u32, 0_u32)
  LibTermbox.change_cell( 2, 0, 'e'.ord.to_u32, 0_u32, 0_u32)
  LibTermbox.change_cell( 3, 0, 's'.ord.to_u32, 0_u32, 0_u32)
  LibTermbox.change_cell( 4, 0, 's'.ord.to_u32, 0_u32, 0_u32)
  LibTermbox.change_cell( 5, 0, ' '.ord.to_u32, 0_u32, 0_u32)
  LibTermbox.change_cell( 6, 0, 'q'.ord.to_u32, 0_u32, 0_u32)
  LibTermbox.change_cell( 7, 0, ' '.ord.to_u32, 0_u32, 0_u32)
  LibTermbox.change_cell( 8, 0, 't'.ord.to_u32, 0_u32, 0_u32)
  LibTermbox.change_cell( 9, 0, 'o'.ord.to_u32, 0_u32, 0_u32)
  LibTermbox.change_cell(10, 0, ' '.ord.to_u32, 0_u32, 0_u32)
  LibTermbox.change_cell(11, 0, 'e'.ord.to_u32, 0_u32, 0_u32)
  LibTermbox.change_cell(12, 0, 'x'.ord.to_u32, 0_u32, 0_u32)
  LibTermbox.change_cell(13, 0, 'i'.ord.to_u32, 0_u32, 0_u32)
  LibTermbox.change_cell(14, 0, 't'.ord.to_u32, 0_u32, 0_u32)
  LibTermbox.change_cell(15, 0, '!'.ord.to_u32, 0_u32, 0_u32)
  LibTermbox.present

  loop do
    LibTermbox.poll_event(out event)
    if LibTermbox::EventType.new(event.type) == LibTermbox::EventType::Key && 'q'.ord == event.ch
      break
    end
  end
rescue ex
  error = ex
ensure
  LibTermbox.shutdown
end
STDERR.puts error if error
