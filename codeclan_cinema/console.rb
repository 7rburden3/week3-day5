require( 'pry-byebug' )
require_relative( 'models/tickets' )
require_relative( 'models/customers' )
require_relative( 'models/films' )

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()


film1 = Film.new({
  'title' => 'Frantic',
  'price' => '5'
  })
film1.save()

film2 = Film.new({
  'title' => 'Star Wars',
  'price' => '8'
  })
film2.save()

film3 = Film.new({
  'title' => 'Harry Potter and the Implausible Coincidences',
  'price' => '10'
  })
film3.save()

customer1 = Customer.new({
  'name' => 'John',
  'funds' => 50
  })
customer1.save()

customer2 = Customer.new({
  'name' => 'Alex',
  'funds' => 40
  })
customer2.save()

customer3 = Customer.new({
  'name' => 'Katie',
  'funds' => 60
  })
customer3.save()

ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film1.id
  })
ticket1.save()

ticket2 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film2.id
  })
ticket2.save()

ticket3 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film2.id
  })
ticket3.save()

ticket4 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film3.id
  })
ticket4.save()

ticket5 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film3.id
  })
ticket5.save()

ticket6 = Ticket.new({
  'customer_id' => customer3.id,
  'film_id' => film3.id
  })
ticket6.save()

# p Film.all()
# p Customer.all()
# film3.title = 'Harry Potter and the Even More Implausible Coincidences'
# p film3.update()
# p customer2.films()
p film2.customers()

binding.pry
nil
