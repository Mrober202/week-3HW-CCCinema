require_relative( '../db/sql_runner')

class Customer

  attr_accessor :id, :name, :funds

  def initialize(options)
    @id = options['id'].to_i()
    @name = options['name']
    @funds = options['funds']
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ('#{@name}', '#{@funds}') RETURNING id ;"
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i()
  end

  def update()
  sql = "UPDATE customers SET (name, funds) = ('#{@name}', #{@funds}) WHERE id = #{@id};"
  SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM customers ;"
    customers = SqlRunner(sql)
    details = customers.map { |customer| Customer.new(customer)}
    return details
  end

  def self.delete_all()
    sql = "DELETE FROM customers ;"
    SqlRunner.run(sql)
  end

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE customer_id = #{@id};"
    result = SqlRunner.run(sql)
    films = result.map {|film| film['name']}
    return films
  end


end