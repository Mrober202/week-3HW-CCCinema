require_relative( '../db/sql_runner')

class Film

  attr_accessor :id, :title, :price

  def initialize(options)
    @id = options['id'].to_i()
    @title = options['title']
    @price = options['price'].to_i()
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ('#{@title}', #{@price}) RETURNING id ;"
    film = SqlRunner.run(sql).first
    @id = film['id'].to_i()
  end

  def update()
  sql = "UPDATE films SET (title, price) = ('#{@title}', #{@price}) WHERE id = #{@id};"
  SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM films ;"
    films = SqlRunner(sql)
    details = films.map { |film| Film.new(film)}
    return details
  end

  def self.delete_all()
    sql = "DELETE FROM films ;"
    SqlRunner.run(sql)
  end

  def customers()
    sql = "SELECT customers.* FROM customers INNER JOIN tickets ON customers.id = tickets.customer_id WHERE tickets.film_id = #{@id};"
    result = SqlRunner.run(sql)
    customers = result.map {|customer| customer['title']}
    return customers
  end

end