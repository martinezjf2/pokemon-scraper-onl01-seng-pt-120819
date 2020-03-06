# filter_parameter_loggingrequire "pry"
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
    hash = {}
    arr = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    hash[:id] = arr[0]
    hash[:type] = arr[2]
    hash[:name] = arr[1]
    hash[:db] = db
    new_pokemon = self.new(hash)
    return new_pokemon
  end


end
