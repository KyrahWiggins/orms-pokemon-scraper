class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
     @id = id
     @name = name
     @type = type
     @db = db

  end

  def self.save(name, type, db)

      # db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
     sql = <<-SQL
     INSERT INTO pokemon (name, type)
     VALUES (?, ?)
     SQL

      db.execute(sql, name , type)

  end

  def self.find(id, db)
     sql = <<-SQL
     SELECT *
     FROM pokemon
     WHERE id = ?
     LIMIT 1
     SQL

      # poke = db.execute(sql, id).flatten ==> Same thing with db.execute(sql, id)[0] to get data out of 
     poke = db.execute(sql, id)[0]
     Pokemon.new(id: poke[0], name: poke[1], type: poke[2], db:db)
 end

  end