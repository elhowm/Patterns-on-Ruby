#!/home/kris/.rvm/wrappers/ruby-2.2.0/ruby
require 'pg'
require_relative 'db_connector'
DB = DBConnector.new('', '', '') # DB Name, user, password
require_relative 'record'
require_relative 'model'
require_relative 'view'
require_relative 'controller'

loop do
  puts 'What you would do? (find_user, user_list, exit)'
  cmd = gets.chop
  next unless ['exit', 'user_list', 'find_user'].include? cmd
  break if cmd == 'exit'
  UserController.send(cmd)
end

puts 'bye!'
