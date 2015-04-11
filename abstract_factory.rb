#!/home/kris/.rvm/wrappers/ruby-2.2.0/ruby

class AbstractFactory
  def products_list
    puts %q|It's abstruct factory method|
  end

  def give_random_product
    puts %q|It's abstruct factory method|
  end
end

class AutoFactory < AbstractFactory
  def initialize
    @products = ['Mercedes', 'Aston Martin', 'BMW']
  end

  def products_list
    @products.each { |auto| puts auto }
  end

  def give_random_product
    puts @products[rand(@products.size)]
  end
end

class FlowerFactory < AbstractFactory
  def initialize
    @products = ['Marigold', 'Rose', 'Chamomile']
  end

  def products_list
    @products.each { |flower| puts flower }
  end

  def give_random_product
    puts @products[rand(@products.size)]
  end
end

abstruct_factory = AbstractFactory.new

auto_factory = AutoFactory.new

flower_factory = FlowerFactory.new

puts 'Abstruct factory methods:'
puts 'Products list:'
puts abstruct_factory.products_list
puts 'Give random product:'
puts abstruct_factory.give_random_product

puts '==================================='

puts 'Auto factory methods:'
puts 'Products list:'
puts auto_factory.products_list
puts 'Give random product:'
puts auto_factory.give_random_product

puts '==================================='

puts 'Flower factory methods:'
puts 'Products list:'
puts flower_factory.products_list
puts 'Give random product:'
puts flower_factory.give_random_product
