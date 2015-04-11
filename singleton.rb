#!/home/kris/.rvm/wrappers/ruby-2.2.0/ruby

class Singleton
  def self.new
    @instance ||= Object.new
  end
end

a = Singleton.new

b = Singleton.new

puts a.object_id

puts b.object_id
