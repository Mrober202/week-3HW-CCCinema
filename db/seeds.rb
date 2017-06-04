require_relative ('../models/customer')
require_relative ('../models/films')
require_relative ('../models/ticket')

require('pry_byebug')

Ticket.delete_all()
Film.delete_all()
customer.delete_all()

customer1 = Customer.new({ 'name' => 'Tony', 'funds' => 20})
customer2 = Customer.new({ 'Henry' => 'Henry', 'funds' => 30})

customer1.save()
customer2.save()

film1 = Film.new({'title' => '', 'price' => 6})
film2 = Film.new({'title' => '', 'price' => 7})

film1.save()
film2.save()

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film2.id})
ticket3 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film2.id})
ticket4 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film1.id})

ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()

binding.pry
nil