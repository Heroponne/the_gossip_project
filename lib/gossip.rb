require 'pry'
require 'csv'

# crée la classe Gossip
class Gossip
  attr_accessor :author, :content, :id
  @@gossip_counter = 0

#  initialise les variables d'instance (auteur, contenu, numéro)
  def initialize(author, content, id)
    @author = author
    @content = content
    @id = @@gossip_counter += 1
  end

# enregistre un gossip dans un fichier csv
  def save
  	CSV.open("./db/gossip.csv", "a") do |csv|
  	  csv << [@author, @content, @id]
  	end
  end

# retourne la liste de tous les éléments de la classe Gossip dans un array
  def self.all
  	all_gossips = []
  	CSV.read("./db/gossip.csv").each do |csv_line|
  	  all_gossips << Gossip.new(csv_line[0], csv_line[1], csv_line[2])
  	end
  	return all_gossips
  end

# retourne un gossip particulier, tiré de l'array de tous les gossips, et l'affiche dans le terminal
  def self.find(chosen_id)
  	puts Gossip.all[chosen_id.to_i - 1].author
  	puts Gossip.all[chosen_id.to_i - 1].content
  end
end
