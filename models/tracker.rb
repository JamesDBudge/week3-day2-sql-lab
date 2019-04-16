require('pg')

class Property

  attr_accessor address:, number_of_bedrooms:, value:, buylet_status:
  attr_reader id:

def initialize( options )
  @address = options['address']
  @number_of_bedrooms = options['number_of_bedrooms'].to_i
  @value = options['value'].to_i
  @buylet_status = options['buylet_status']
  @id = options['id'].to_i if options['id']
end







end
