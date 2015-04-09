class DBConnector
  def self.new(db_name = nil, user = nil, password = nil)
    @connection ||= PG::Connection.new(dbname: db_name, user: user, password: password)
  end

  def exec(query)
    @connection.exec query
  end
end
