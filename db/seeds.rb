# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Survey.destroy_all
Question.destroy_all

fsa_list = ['M3A',	'M4A',	'M5A',	'M6A',	'M7A',	'M9A',
'M1B',	'M3B',	'M4B',	'M5B',	'M6B',	'M9B',
'M1C',	'M3C',	'M4C',	'M5C',	'M6C',	'M9C',
'M1E',	'M4E',	'M5E',	'M6E',
'M1G',	'M4G',	'M5G',	'M6G',
'M1H',	'M2H',	'M3H',	'M4H',	'M5H',	'M6H',
'M1J',	'M2J',	'M3J',	'M4J',	'M5J',	'M6J',
'M1L',	'M2L',	'M3L',	'M4L',	'M5L',	'M6L',	'M9L',
'M1M',	'M2M',	'M3M',	'M4M',	'M5M',	'M6M',	'M9M',
'M1K',	'M2K',	'M3K',	'M4K',	'M5K',	'M6K',
'M1N',	'M2N',	'M3N',	'M4N',	'M5N',	'M6N',	'M9N',
'M1P',	'M2P',	'M4P',	'M5P',	'M6P',	'M9P',
'M1R',	'M2R',	'M4R',	'M5R',	'M6R',	'M7R',	'M9R',
'M1S',	'M4S',	'M5S',	'M6S',
'M1T',	'M4T',	'M5T',
'M1V',	'M4V',	'M5V',	'M8V',	'M9V',
'M1X',	'M4X',	'M5X',	'M8X',
'M4Y',	'M7Y',	'M8Y',
'M8Z']

20.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.free_email,
    password: 'password',
    password_confirmation: 'password',
    phone: 1234567890
  )
end


Faker::Config.random = Random.new(1)
pop_culture = {"LordOfTheRings"=>[],"DrWho"=>[],"StarWars"=>[],"Simpsons"=>[], "FamilyGuy" => []}
pop_culture.each do |franchise, options|
  Faker::Config.random = Random.new(1)
  while options.length < 10 do
    call = eval("Faker::"+franchise).character
    puts call
    if options.include?(call) == false
      options << call
    end
  end
  this_survey = Survey.create!(name: franchise)
  index= 0
  while index < 10 do
    question = Question.create!(
      option_a: options[index],
      option_b: options[index + 1],
      survey: this_survey
    )
    index += 2
  end
end
pop_culture.inspect
