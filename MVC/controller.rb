class UserController
  def self.find_user
    puts 'Give login of user:'
    user = User.find_by_login(gets.chop)
    UserView.user_info user
  end

  def self.user_list
    users = User.all
    UserView.users_list users
  end
end
