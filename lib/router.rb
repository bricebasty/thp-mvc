# frozen_string_literal: true

require 'pry'
require_relative 'controller'

# Routing Class
class Router
  attr_accessor :controller

  def initialize
    @controller = Controller.new
  end

  def show_menu
    puts "\nBIENVENUE DANS THE GOSSIP PROJECT"
    loop do
      puts <<~ACCUEIL

        Tu veux faire quoi jeune mouss' ?
        1. Je veux créer un gossip
        4. Je veux quitter l'app
      ACCUEIL
      print '> '
      choose_in_menu
    end
  end

  def choose_in_menu
    case gets.chomp.to_i
    when 1 then @controller.create_gossip
    when 2 then @controller.index_gossip
    when 4 then abort "\nAllez Ciao"
    else
      puts '\nEntrée invalide, réessaye'
    end
  end
end
