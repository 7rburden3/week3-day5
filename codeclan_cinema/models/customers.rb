require_relative('../db/sql_runner')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (
    name,
    funds
    ) VALUES (
      $1, $2
      )
      RETURNING id;"
      values = [@name, @funds]
      customer = SqlRunner.run(sql, values).first
      @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3;"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE * FROM customers WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT films.*
    FROM films
    INNER JOIN tickets
    ON tickets.film_id = films.id
    WHERE tickets.customer_id = $1;"
    values = [@id]
    film_data = SqlRunner.run(sql, values)
    return Film.map_items(film_data)
  end

  # select all from tickets by given customer id return the count of the customer objects created to give the number of tickets bought by that customer.
  def tickets()
    sql = "SELECT * FROM tickets WHERE customer_id = $1;"
    values = [@id]
    tickets = SqlRunner.run(sql, values)
    return Ticket.map_items(tickets).count
  end

  def pay_for_ticket(ticket)
    return if @funds < ticket.price
    @funds -= ticket.price
    update
  end



  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM customers;"
    customer_data = SqlRunner.run(sql)
    return Customer.map_items(customer_data)
  end

  def self.map_items(data)
    result = data.map{ |customer|Customer.new(customer) }
    return result
  end


end # end class
