require_relative "game"

knuckleheads = Game.new("Knuckleheads")

knuckleheads.add_player(Player.new("moe"))
knuckleheads.add_player(Player.new("larry", 90))
knuckleheads.add_player(Player.new("curly", 110))
# knuckleheads.add_player(Player.new("alvin"))
# knuckleheads.add_player(Player.new("simon"))
# knuckleheads.add_player(Player.new("theodore"))

knuckleheads.play(5)
knuckleheads.print_stats
