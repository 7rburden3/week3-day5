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

  def self.delete_all()
    sql = "DELETE FROM screenings;"
    SqlRunner.run(sql)
  end

end # end class
