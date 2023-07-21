# frozen_string_literal: true

require 'pry'
require_relative 'view'
require_relative 'gossip'

# Controls the app
class Controller
  attr_accessor :view

  def initialize
    @view = View.new
  end

  def create_gossip
    values = @view.create_gossip
    gossip = Gossip.new(values[0], values[1])
    gossip.save
  end

  def index_gossip
    @view.index_gossip(Gossip.all)
  end

  def delete_gossip
    line = @view.delete_gossip
    Gossip.delete(line)
  end
end
