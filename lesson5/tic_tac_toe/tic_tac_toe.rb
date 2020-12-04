Dir["lib/*.rb"].each { |rel_path| require_relative rel_path }

game = TTTGame.new
game.play
