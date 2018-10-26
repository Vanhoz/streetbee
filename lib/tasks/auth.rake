namespace :auth do
  desc "get JWT token to a user"
  task get_user_token: :environment do
    auth_token = AuthenticateUser.new('example@mail.com', '123123').call
    puts auth_token
  end

end
