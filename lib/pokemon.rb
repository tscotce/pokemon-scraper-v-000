require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(pokemon)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end
  
  def self.save(name, type, db, hp = nil)
    db.execute("INSERT INTO pokemon (name, type, hp) VALUES (?, ?, ?)", name, type, hp)
  end
  
  def self.find(id, db)
    pk = db.execute("SELECT * FROM pokemon WHERE id = '#{id}'")
    pokemon = Pokemon.new(pk)
    pokemon.id = pk[0][0]
    pokemon.name = pk[0][1]
    pokemon.type = pk[0][2]
    pokemon
  end
  
end
