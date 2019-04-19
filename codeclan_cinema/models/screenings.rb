require_relative('../db/sql_runner')

class Screening

  attr_reader :id, :starts_at, :film_id
  attr_accessor :seats

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id'].to_i
    @starts_at = options['starts_at']
    @seats = options['seats'].to_i
  end

  def save()
    sql = "INSERT INTO screenings (
    film_id,
    starts_at,
    seats) VALUES (
      $1, $2, $3
      ) RETURNING id;"
      values =[@film_id, @starts_at, @seats]
      screening = SqlRunner.run(sql, values).first
      @id = screening['id'].to_i
  end

  def update()
    sql = "UPDATE screenings SET (film_id, starts_at, seats) = ($1, $2, $3) WHERE id = $4;"
    values = [@film_id, @starts_at, @seats, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE * FROM customers WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM screenings;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM screenings;"
    screening_data = SqlRunner.run(sql)
    return Screening.map_items(screening_data)
  end

  def self.map_items(data)
    result = data.map { |screening| Screening.new(screening) }
    return result
  end

end # end class
