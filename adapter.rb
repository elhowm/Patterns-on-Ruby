#!/home/kris/.rvm/wrappers/ruby-2.2.0/ruby

class BinaryStore
  attr_reader :data

  def initialize
    @data = []
  end

  def data=(new_data)
    validate_data(new_data)
    @data = new_data
  end

  private

  def raise_error(key)
    fail 'wrong data format' if key == :format
  end

  def validate_data
    fail %q|It is abstract method! You should override it by inheritance.|
  end
end

class OldBinaryStore < BinaryStore
  private

  def validate_data(new_data)
    raise_error(:format) unless new_data.kind_of? Array
    unless new_data.empty?
      raise_error(:format) unless new_data.map{ |e| [0, 1].include? e }.reduce(:&)
    end
  end
end

class NewBinaryStore < BinaryStore
  private

  def boolean?(instance)
    [TrueClass, FalseClass].include? instance.class
  end

  def validate_data(new_data)
    raise_error(:format) unless new_data.kind_of? Array
    unless new_data.empty?
      raise_error(:format) unless new_data.map{ |e| boolean? e }.reduce(:&)
    end
  end
end

class Adapter
  def self.convert_to_new_store(old_store)
    fail 'store wrong format' unless old_store.kind_of? OldBinaryStore
    new_store = NewBinaryStore.new
    new_store.data = old_store.data.map{ |e| !e.zero? }
    new_store
  end
end

class Worker
  def all_data_is_true?(store)
    fail 'store wrong format' unless store.kind_of? NewBinaryStore
    store.data.reduce(:&)
  end
end

old_store = OldBinaryStore.new
old_store.data = [1, 1, 0]

worker = Worker.new
puts worker.all_data_is_true? Adapter.convert_to_new_store(old_store)
