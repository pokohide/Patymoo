Faker::Config.locale = :ja

1.upto(100).each do |i|
  Event.seed(:id) do |event|
    event.id = i
    event.admin_id = i % 30 + 1
    event.name = Faker::Pokemon.name
    event.description = Faker::Lorem.paragraph(2)
    event.link = Faker::Internet.url
    event.start_at = Faker::Time.between(DateTime.now - 1, DateTime.now)
  end
end
