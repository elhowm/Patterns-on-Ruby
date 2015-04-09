class UserView
  def self.user_info(user)
    if user.object.nil?
      puts 'User not founded!'
    else
      puts "Login: #{user.login}"
      puts "Last Name: #{user.last_name}"
      puts "First Name: #{user.first_name}"
      puts "Father Name: #{user.father_name}"
    end
  end

  def self.users_list(list)
    max = list.map{|user| [user['login'].to_s.size, user['last_name'].to_s.size, user['first_name'].to_s.size, user['father_name'].to_s.size].max}.max
    printf "%-#{max}s %-#{max}s %-#{max}s %s\n", 'Login', 'Last name', 'First name', 'Father name'
    puts
    list.each do |user|
      printf "%-#{max}s %-#{max}s %-#{max}s %s\n", user['login'], user['last_name'], user['first_name'], user['father_name']
    end
  end
end
