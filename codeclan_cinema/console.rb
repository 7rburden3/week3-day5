require( 'pry-byebug' )
require_relative( 'models/tickets' )
require_relative( 'models/customers' )
require_relative( 'models/films' )
require_relative( 'models/screenings')

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()
Screening.delete_all()


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

screening1 = Screening.new({
  'film_id' => film1.id,
  'starts_at' => '04-19-2019 18:30:00',
  'seats' => 2})
screening1.save()

screening2 = Screening.new({
  'film_id' => film2.id,
  'starts_at' => '05-19-2019 19:30:00',
  'seats' => 3})
screening2.save()

screening3 = Screening.new({
  'film_id' => film3.id,
  'starts_at' => '06-19-2019 20:30:00',
  'seats' => 1})
screening3.save()

# p Film.all()

# p Customer.all()

# film3.title = 'Harry Potter and the Even More Implausible Coincidences'

# p film3.update()

# p customer2.films()

# p film2.customers()

# p customer1.tickets()

# p film3.tickets()

# p customer1.funds()
# customer1.pay_for_ticket(film1)
# p customer1.funds()

binding.pry
nil
