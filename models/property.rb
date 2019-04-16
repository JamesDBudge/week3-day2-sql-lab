require('pg')
require('pry-byebug')


class Property

  attr_accessor :address, :number_of_bedrooms, :value, :buylet_status
  attr_reader :id

def initialize( options )
  @id = options['id'].to_i if options['id']
  @address = options['address']
  @number_of_bedrooms = options['number_of_bedrooms'].to_i
  @value = options['value'].to_i
  @buylet_status = options['buylet_status']
end

def save()
  db = PG.connect({dbname: 'property_tracker', host: 'localhost'});
  sql = "INSERT INTO property_tracker (address, value, number_of_bedrooms, buylet_status) VALUES ($1, $2, $3, $4) RETURNING id;"
  values = [@address, @value, @number_of_bedrooms, @buylet_status]
  db.prepare("save", sql)
  property_hashes = db.exec_prepared("save", values)
  @id = property_hashes[0]['id']
  db.close()
end

def delete()
  db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
  sql = "DELETE FROM property_tracker WHERE id = $1;"
  values = [@id]
  db.prepare("delete_one", sql)
  db.exec_prepared("delete_one", values)
  db.close()
end

def Property.delete_all()
  db = PG.connect({dbname: 'property_tracker', host: 'localhost'});
  sql = "DELETE FROM property_tracker;"
  db.prepare("delete_all", sql)
  db.exec_prepared("delete_all")
  db.close()
end

def Property.all()
  db = PG.connect({dbname: 'property_tracker', host: 'localhost'});
  sql = "SELECT * FROM property_tracker;"
  property_hashes = db.exec(sql)
  property_object = property_hashes.map { |property| Property.new(property) }
  db.close()
  return property_object
end

def update
  db = PG.connect({dbname: 'property_tracker', host: 'localhost'});
  sql = "UPDATE property_tracker SET (address, value, number_of_bedrooms, buylet_status) = ($1,$2,$3,$4) WHERE id = $5"
  values = [@address,@value,@number_of_bedrooms,@buylet_status,@id]
  db.prepare("update", sql)
  db.exec_prepared("update", values)
  db.close()
end

def Property.find(id)
  db = PG.connect({dbname: 'property_tracker', host: 'localhost'});
  sql = "SELECT * FROM property_tracker WHERE id = $1"
  values = [id]
  db.prepare("find", sql)
  prep = db.exec_prepared("find", values)
  # binding.pry
  #property_hashes = db.exec(prep)
  #property_object = property_hashes.map { | property| Property.new(property)}
  db.close()
  return prep[0]
end

def Property.find_by_address(address)
  db = PG.connect({dbname: 'property_tracker', host: 'localhost'});
  sql = "SELECT * FROM property_tracker WHERE address = $1"
  values = [address]
  db.prepare("find", sql)
  prep = db.exec_prepared("find", values)
  # p prep
  db.close()
  if prep.ntuples == 0
    return nil
  else

  # binding.pry
  return prep[0] unless prep[0].nil?
  end

end

end
