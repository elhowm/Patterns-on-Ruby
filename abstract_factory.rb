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
    @products.each { |auto| p auto }
    nil
  end

  def give_random_product
    p @products[rand(@products.size)]
    nil
  end
end

class FlowerFactory < AbstractFactory
  def initialize
    @products = ['Marigold', 'Rose', 'Chamomile']
  end

  def products_list
    @products.each { |flower| p flower }
    nil
  end

  def give_random_product
    p @products[rand(@products.size)]
    nil
  end
end

abstruct_factory = AbstractFactory.new

auto_factory = AutoFactory.new

flower_factory = FlowerFactory.new

p 'Abstruct factory methods:'
p 'Products list:'
p abstruct_factory.products_list
p 'Give random product:'
p abstruct_factory.give_random_product

p '==================================='

p 'Auto factory methods:'
p 'Products list:'
p auto_factory.products_list
p 'Give random product:'
p auto_factory.give_random_product

p '==================================='

p 'Flower factory methods:'
p 'Products list:'
p flower_factory.products_list
p 'Give random product:'
p flower_factory.give_random_product
