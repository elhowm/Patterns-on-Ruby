class User < Record
  attr_accessor :login, :first_name, :last_name, :father_name
  
  def self.find(id)
    user = User.new
    user.object = DB.exec("SELECT * FROM #{self.to_s.downcase.sub(' ', '_')}s WHERE id = #{id} LIMIT 1").to_a.first
    user.load_attributes
    user
  end

  def self.find_by_login(login)
    user = User.new
    user.object = DB.exec("SELECT * FROM #{self.to_s.downcase.sub(' ', '_')}s WHERE login = '#{login}' LIMIT 1").to_a.first
    user.load_attributes
    user
  end

  def self.all
    DB.exec("SELECT * FROM #{self.to_s.downcase.sub(' ', '_')}s").to_a
  end

  def reload
    self.object = DB.exec("SELECT * FROM #{self.class.to_s.downcase.sub(' ', '_')}s WHERE id = #{id} LIMIT 1").to_a.first
    self.login, self.first_name, self.last_name, self.father_name = user['login'], user['first_name'], user['last_name'], user['father_name']
    true
  end

  def load_attributes
    unless object.nil?
      self.login, self.first_name = object['login'], object['first_name']
      self.last_name, self.father_name = object['last_name'], object['father_name']
    end
  end
end
