# frozen_string_literal: true

require 'pry'
require 'csv'

class Gossip
  attr_reader :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
    CSV.open("db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
    puts "\nC'est sauvegardé boss."
  end

  def self.all
    all_gossips = []
    CSV.each do |line|
      temp_gossip = Gossip.new(values[0], values[1])
      all_gossips << temp_gossip
    end
    all_gossips
  end
end
