class MacroCommand

  def initialize(commands)
    @commands = commands
  end

  def execute
    @commands.each do |command|
      command.execute
    end
  end

  def undo
    @commands.each do |command|
      command.undo
    end
  end

  def to_s
    "Macro command: [\n" + @commands.join(", ") + "\n]"
  end

end
