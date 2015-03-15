#!/home/kris/.rvm/wrappers/ruby-2.2.0/ruby

class Singleton
  def self.new
    return @instance ||= Object.new
  end
end

a = Singleton.new

b = Singleton.new

p a.object_id

p b.object_id
