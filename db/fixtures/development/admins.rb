Faker::Config.locale = :ja

1.upto(30).each do |i|
  Admin.seed(:id) do |admin|
    admin.id = i
    admin.username = Faker::Team.unique.name
    admin.email = "othlotech#{i}@gmail.com"
    admin.password = 'password'
    admin.activation_state = 'active'
  end
end
