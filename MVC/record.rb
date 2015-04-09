class Record
  attr_accessor :object

  protected
  @@connector = DBConnector.new
end
