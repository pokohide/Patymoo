Faker::Config.locale = :ja

1.upto(100).each do |i|
  Member.seed(:id) do |member|
    member.id = i
    member.admin_id = i % 30 + 1
    member.name = Faker::Name.name
    member.email = Faker::Internet.free_email
    screen_name = Faker::Ancient.hero
    member.twitter = screen_name
    member.facebook = screen_name
    member.connpass = screen_name
    member.grade = Member.grades.keys.sample
    member.school_type = Member.school_types.keys.sample
    member.school_name = Faker::University.name
    member.department = Faker::Company.name
    member.phone_number = Faker::PhoneNumber.cell_phone
    member.note = Faker::Lorem.sentence
  end
end
