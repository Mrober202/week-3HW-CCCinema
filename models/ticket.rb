require_relative( '../db/sql_runner')

class Ticket

  attr_accessor :id, :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i()
    @customer_id = options['customer_id']
    @film_id = options['film_id']
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id) VALUES ('#{@customer_id}', '#{@film_id}') RETURNING id ;"
    ticket = SqlRunner.run(sql).first
    @id = ticket['id'].to_i()
  end

  def update()
  sql = "UPDATE tickets SET (customer_id, film_id) = ('#{@customer_id}', '#{@film_id}') WHERE id = #{@id};"
  SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM tickets ;"
    tickets = SqlRunner(sql)
    details = tickets.map { |ticket| Ticket.new(ticket)}
    return details
  end

  def self.delete_all()
    sql = "DELETE FROM tickets ;"
    SqlRunner.run(sql)
  end

end