require "awesome_print"

AwesomePrint.pry!

def aliases(**map)
  if defined?(PryByebug)
    map.each { |orig, sub| Pry.commands.alias_command(sub, orig.to_s) }
  end
end

# alias byebug commands
aliases(
  step: "ss",
  next: "nn",
  finish: "ff",
  quit: "qq",
  exit: "ee",
  continue: "cc",
  "disable-pry": "bail"
)

# enter to repeat last command
Pry::Commands.command(/^$/, "repeat last command") do
  _pry_.run_command Pry.history.to_a.last
end

