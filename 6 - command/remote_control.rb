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
    @last_command = @on_commands[slot]
  end

  def off_button(slot)
    @off_commands[slot].execute
    @last_command = @off_commands[slot]
  end

  def undo_button
    @last_command.undo
  end
end
