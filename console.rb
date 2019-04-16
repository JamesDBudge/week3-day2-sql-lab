require_relative('models/property.rb')

house1 = { 'address' => '1 High Street', 'value' => '10000', 'number_of_bedrooms' => 4, 'buylet_status' => 'Buy'}
house2 = { 'address' => '20 King Place', 'value' => '2000000', 'number_of_bedrooms' => 10, 'buylet_status' => 'Buy'}

query1 = Property.new(house1)
query2 = Property.new(house2)

query1.save()
