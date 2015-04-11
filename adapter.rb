#!/home/kris/.rvm/wrappers/ruby-2.2.0/ruby

class Dude
  attr_accessor :personal_data

  def initialize(data)
    @personal_data = {
      eng: { name: data[:eng][:name], surname: data[:eng][:surname] },
      ukr: { name: data[:ukr][:name], surname: data[:ukr][:surname]},
      phone: data[:phone],
      email: data[:email]
    }
  end

  def english
    {name: personal_data[:eng][:name], surname: personal_data[:eng][:surname], email: personal_data[:email], phone: personal_data[:phone]}
  end

  def ukrainian
    {name: personal_data[:ukr][:name], surname: personal_data[:ukr][:surname], email: personal_data[:email], phone: personal_data[:phone]}
  end
end

class Speaker
  def initialize(dude)
    @dude = dude
  end

  def english
    change_locale :eng
    puts "Hi, I'm #{get_full_name}"
    puts "You can also get in touch with me by email: #{@dude_info[:email]}, or phone: #{@dude_info[:phone]}"
  end

  def ukrainian
    change_locale :ukr
    puts "Привіт, я #{get_full_name}"
    puts "Ви можете звязатись зі мною по email: #{@dude_info[:email]}, або за телефоном: #{@dude_info[:phone]}"
  end

  private

  def change_locale locale
    @dude_info = case locale
                 when :eng then @dude.personal_data[:eng].merge({phone: @dude.personal_data[:phone], email: @dude.personal_data[:email]})
                 when :ukr then @dude.personal_data[:ukr].merge({phone: @dude.personal_data[:phone], email: @dude.personal_data[:email]})
                 end
  end

  def get_full_name
    "#{@dude_info[:surname]} #{@dude_info[:name]}"
  end
end

dude = Dude.new({ukr: {name: 'Ростислав', surname: 'Сафонов'}, eng: {name: 'Rostislav', surname: 'Safonov'}, phone: '09876234', email: 'bla@bla.com'})
speaker = Speaker.new(dude)

puts 'Saying in english:'
speaker.english
puts 'Saying in ukrainian:'
speaker.ukrainian
