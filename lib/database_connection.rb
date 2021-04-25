require 'pg'

class DatabaseConnection
  # makes a PG connection
  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end

  # cites the attribute.
  def self.connection # this is a CLASS INSTANCE variable.
    @connection
  end

  # executes a query
  def self.query(sql)
    @connection.exec(sql)
  end
  # because we're never instantiating our DBConn object, we use a
  # CLASS INSTANCE variable, in the same way that we use a CLASS method.
end
