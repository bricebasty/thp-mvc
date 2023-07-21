# frozen_string_literal: true

require 'pry'

# Shows to the user things
class View
  def create_gossip
    puts "\nCrée un gossip"
    puts "\nMets ton nom"
    input1 = gets.chomp
    puts "\nMets ton super gossip"
    input2 = gets.chomp
    [input1, input2]
  end
end
