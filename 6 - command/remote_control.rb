class RemoteControl
  def initialize
    @on_commands = Array.new(7)
    @off_commands = Array.new(7)
  end

  def set_command(slot, on_command, off_command)
    @on_commands[slot] = on_command
    @off_commands[slot] = off_command
  end

  def on_button(slot)
    @on_commands[slot].execute
  end

  def off_buttons(slot)
    @off_commands[slot].execute
  end
end
