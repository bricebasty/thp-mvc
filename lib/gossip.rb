# frozen_string_literal: true

require 'pry'
require 'csv'

# Model of the app
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
    CSV.foreach('db/gossip.csv') do |row|
      temp_gossip = Gossip.new(row[0], row[1])
      all_gossips << temp_gossip
    end
    all_gossips
  end

  def self.delete(line)
    # Mets toutes les données du CSV dans une variable
    data = CSV.read('db/gossip.csv')
    binding.pry
    # Enlève la ligne que l'on a spécifié dans la variable
    data.delete_at(line - 1)
    # Ecris dans le csv la data modifiée
    CSV.open('db/gossip.csv', 'w') do |csv|
      data.each do |row|
        csv << row
      end
    end
  end
end
