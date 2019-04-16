require('pg')

class Property

  attr_accessor :address, :number_of_bedrooms, :value, :buylet_status
  attr_reader :id

def initialize( options )
  @address = options['address']
  @number_of_bedrooms = options['number_of_bedrooms'].to_i
  @value = options['value'].to_i
  @buylet_status = options['buylet_status']
  @id = options['id'].to_i if options['id']
end

def save()
  db = PG.connect({dbname: 'property_tracker', host: 'localhost'});
  sql = "INSERT INTO property_tracker (address, value, number_of_bedrooms, buylet_status) VALUES ($1, $2, $3, $4)"
  values = [@address, @value, @number_of_bedrooms, @buylet_status]
  db.prepare("save", sql)
  db.exec_prepared("save", values)


  db.close()
end






end
