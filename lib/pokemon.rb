require "pry"
class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id
  
  def initialize(hash)
    @name = hash[:name]
    @type = hash[:type]
    @db = hash[:db]
    @id = hash[:id]
  end
  
  def self.save(name, type, db)
    # binding.pry
    arr = db.execute("SELECT * FROM pokemon")
    id = arr.size + 1
    sql = <<-SQL
      INSERT INTO pokemon (id, name, type)
      VALUES(?, ?, ?)
    SQL
    db.execute(sql, id, name, type)
  end
  
  def self.find(id, db)
    # binding.pry
    arr = db.execute("SELECT * FROM pokemon WHERE id = ?", [id])
    new_pokemon = self.new(pokemon)
    new_pokemon.id = pokemon[0][0]
    new_pokemon.type = pokemon[0][2]
    new_pokemon.name = pokemon[0][1]
    return new_pokemon
  end


end
