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


fsa_list.each do |code|
  Fsa.create!(name: code)
  sleep 2
end

20.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.free_email,
    password: 'password',
    password_confirmation: 'password',
    gender: gender_weighted_list.sample,
    looking_for: looking_for_list.sample,
    phone: 1234567890,
    fsa: Fsa.all.sample,
    rand(0..150000)
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

# =============== Special Seeds ===================
spec_count = 1
Fsa.all do |code|
  spec_count += 1
  user = User.create!(
    name: "#{special_names.sample} #{special_names.sample}",
    email: "#{Faker::Internet.free_email}#{spec_count}",
    password: 'password',
    password_confirmation: 'password',
    gender: gender_weighted_list.sample,
    looking_for: looking_for_list.sample,
    phone: 1234567890,
    fsa: code,
    rand(0..150000)
  )
end

# females have higher income
120.times do
  user = User.create!(
    name: "#{special_names.sample} #{special_names.sample}",
    email: "#{Faker::Internet.free_email}#{spec_count}",
    password: 'password',
    password_confirmation: 'password',
    gender: gender_list[1],
    looking_for: looking_for_list.sample,
    phone: 1234567890,
    fsa: Fsa.all.sample,
    rand(60000..150000)
  )
end

# males looking for networking
80.times do
  user = User.create!(
    name: "#{special_names.sample} #{special_names.sample}",
    email: "#{Faker::Internet.free_email}#{spec_count}",
    password: 'password',
    password_confirmation: 'password',
    gender: gender_list[0],
    looking_for: looking_for_list[2],
    phone: 1234567890,
    fsa: Fsa.all.sample,
    rand(0..150000)
  )
end

# other gender looking for activity partners
20.times do
  user = User.create!(
    name: "#{special_names.sample} #{special_names.sample}",
    email: "#{Faker::Internet.free_email}#{spec_count}",
    password: 'password',
    password_confirmation: 'password',
    gender: gender_list[2],
    looking_for: looking_for_list[1],
    phone: 1234567890,
    fsa: Fsa.all.sample,
    rand(0..150000)
  )
end

# rich fsas
25.times do
  loc_index = rand(0..4)
  user = User.create!(
    name: "#{special_names.sample} #{special_names.sample}",
    email: "#{Faker::Internet.free_email}#{spec_count}",
    password: 'password',
    password_confirmation: 'password',
    gender: gender_weighted_list.sample,
    looking_for: looking_for_list.sample,
    phone: 1234567890,
    fsa: Fsa.all[loc_index],
    rand(80000..150000)
  )
end

# more random users so rich fsas don't also have more people
450.times do
  loc_index = rand(5..95)
  user = User.create!(
    name: "#{special_names.sample} #{special_names.sample}",
    email: "#{Faker::Internet.free_email}#{spec_count}",
    password: 'password',
    password_confirmation: 'password',
    gender: gender_weighted_list.sample,
    looking_for: looking_for_list.sample,
    phone: 1234567890,
    fsa: Fsa.all[loc_index],
    rand(0..150000)
  )
end

# fsas with more people
200.times do
  loc_index = rand(20..24)
  user = User.create!(
    name: "#{special_names.sample} #{special_names.sample}",
    email: "#{Faker::Internet.free_email}#{spec_count}",
    password: 'password',
    password_confirmation: 'password',
    gender: gender_weighted_list.sample,
    looking_for: looking_for_list.sample,
    phone: 1234567890,
    fsa: Fsa.all[loc_index],
    rand(0..150000)
  )
end

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


gender_list = ['male', 'female', 'other']
gender_weighted_list = ['female', 'female', 'female', 'female', 'female', 'female', 'female', 'male', 'male', 'male', 'male', 'other']
looking_for_list = ['Friend', 'Activity Partner', 'Networking']

special_names = ['Captain', 'Broccoli', 'T-Rex', 'Fuchsia', 'Master', 'Night Shade', 'Inceptator', 'Action', 'Hellfire', 'Breakout',
  'X-Ray', 'C-840 G', 'Nebula', 'Winslow', 'Q', 'Betman', 'Obooma', 'River Walk', 'Falling Star', 'DEliGht', 'Sir', 'Ninja', 'Samurai',
  'Surprise', 'Sveltess', 'Robo Rob', 'Imperator', 'Hoopdidoop', 'Lush', 'Mini', 'Commander', 'Fury', 'Wooden Car', 'Quarantine',
  'Forest', 'Guy', 'Gal', 'Hero', 'Jiggy Jaggy', 'Kite Catcher', 'Octopus', 'Pillow', 'Raining', 'Rage', 'Tarantula', 'Time Cutter',
  'Loathing', 'of Hate', 'Vengeful', 'Venom', 'Umbrella', 'Yelling', 'Zero', 'Zelda', ]
