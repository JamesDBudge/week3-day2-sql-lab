require_relative('models/property.rb')

#Property.delete_all()

house1 = { 'address' => '1 High Street', 'value' => '10000', 'number_of_bedrooms' => 4, 'buylet_status' => 'Buy'}
house2 = { 'address' => '20 King Place', 'value' => '2000000', 'number_of_bedrooms' => 10, 'buylet_status' => 'Buy'}

query1 = Property.new(house1)
query2 = Property.new(house2)

# query1.save()
# query1.save()
# query1.save()
# query1.save()
# query1.save()
# query2.save()
# query2.delete()
query1.buylet_status = "Let"
query1.update()

p Property.find('108')
p Property.find_by_address('20 King Place')
p Property.find_by_address('My House')


# p Property.all()
