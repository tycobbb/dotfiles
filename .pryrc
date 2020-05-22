# -- plugins --
# add awesome print
begin
  require "awesome_print"
  Pry.config.print = proc do |output, value|
    Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output)
  end
rescue LoadError
  puts "warning: missing awesome print"
end

# -- keybindings --
def aliases(**map)
  map.each { |orig, sub| Pry.commands.alias_command(sub, orig.to_s) }
end

if defined?(PryByebug)
  aliases(
    step: "ss",
    next: "nn",
    finish: "ff",
    quit: "qq",
    exit: "ee",
    continue: "cc",
    "disable-pry": "bail"
  )
end

# enter repeats last command
Pry::Commands.command(/^$/, "repeat last command") do
  _pry_.run_command(Pry.history.to_a.last)
end

