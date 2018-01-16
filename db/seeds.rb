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


gender_list = ['male', 'female', 'other']
gender_weighted_list = ['female', 'female', 'female', 'female', 'female', 'female', 'female', 'male', 'male', 'male', 'male', 'other']
looking_for_list = ['Friend', 'Activity Partner', 'Networking']

special_names = ['Captain', 'Broccoli', 'T-Rex', 'Fuchsia', 'Master', 'Night Shade', 'Inceptator', 'Action', 'Hellfire', 'Breakout',
  'X-Ray', 'C-840 G', 'Nebula', 'Winslow', 'Q', 'Betman', 'Obooma', 'River Walk', 'Falling Star', 'DEliGht', 'Sir', 'Ninja', 'Samurai',
  'Surprise', 'Sveltess', 'Robo Rob', 'Imperator', 'Hoopdidoop', 'Lush', 'Mini', 'Commander', 'Fury', 'Wooden Car', 'Quarantine',
  'Forest', 'Guy', 'Gal', 'Hero', 'Jiggy Jaggy', 'Kite Catcher', 'Octopus', 'Pillow', 'Raining', 'Rage', 'Tarantula', 'Time Cutter',
  'Loathing', 'of Hate', 'Vengeful', 'Venom', 'Umbrella', 'Yelling', 'Zero', 'Zelda'
]

user_name_list = []

def namer(special_names, user_name_list)

  i = 0
  new_name = nil
  while i < 1 do
    n = 0
    i = 0
    new_name = "#{special_names.sample} #{special_names.sample}"
    user_name_list.each do |name|
      if new_name == name
        n += 1
      end
    end
    if n < 1
      i += 10
    end
  end
  return new_name
end


fsa_list.each do |code|
  Fsa.create!(name: code)
  # sleep 2
end


10.times do
  new_name = Faker::Name.name
  incoom = rand(0..150000)
  user = User.create!(
    name: new_name,
    email: Faker::Internet.free_email(new_name),
    password: 'password',
    password_confirmation: 'password',
    gender: gender_weighted_list.sample,
    looking_for: looking_for_list.sample,
    phone: 1234567890,
    fsa: Fsa.all.sample,
    income: incoom
  )
end


# =============== Special Seeds ===================
spec_count = 1


# females have higher income
9.times do
  now_name = namer(special_names, user_name_list)
  incoom = rand(60000..150000)
  spec_count += 1
  user = User.create!(
    name: now_name,
    email: "#{Faker::Internet.free_email}#{spec_count}",
    password: 'password',
    password_confirmation: 'password',
    gender: gender_list[1],
    looking_for: looking_for_list.sample,
    phone: 1234567890,
    fsa: Fsa.all.sample,
    income: incoom
  )
end

# males looking for networking
8.times do
  now_name = namer(special_names, user_name_list)
  spec_count += 1
  incoom = rand(0..150000)
  user = User.create!(
    name: now_name,
    email: "#{Faker::Internet.free_email}#{spec_count}",
    password: 'password',
    password_confirmation: 'password',
    gender: gender_list[0],
    looking_for: looking_for_list[2],
    phone: 1234567890,
    fsa: Fsa.all.sample,
    income: incoom
  )
end

# other gender looking for activity partners
3.times do
  now_name = namer(special_names, user_name_list)
  spec_count += 1
  incoom = rand(0..150000)
  user = User.create!(
    name: now_name,
    email: "#{Faker::Internet.free_email}#{spec_count}",
    password: 'password',
    password_confirmation: 'password',
    gender: gender_list[2],
    looking_for: looking_for_list[1],
    phone: 1234567890,
    fsa: Fsa.all.sample,
    income: incoom
  )
end

# rich fsas
5.times do
  now_name = namer(special_names, user_name_list)
  spec_count += 1
  incoom = rand(80000..150000)
  loc_index = rand(0..3)
  user = User.create!(
    name: now_name,
    email: "#{Faker::Internet.free_email}#{spec_count}",
    password: 'password',
    password_confirmation: 'password',
    gender: gender_weighted_list.sample,
    looking_for: looking_for_list.sample,
    phone: 1234567890,
    fsa: Fsa.all[loc_index],
    income: incoom
  )
end

# more random users
20.times do
  now_name = namer(special_names, user_name_list)
  spec_count += 1
  incoom = rand(0..150000)
  loc_index = rand(4..95)
  user = User.create!(
    name: now_name,
    email: "#{Faker::Internet.free_email}#{spec_count}",
    password: 'password',
    password_confirmation: 'password',
    gender: gender_weighted_list.sample,
    looking_for: looking_for_list.sample,
    phone: 1234567890,
    fsa: Fsa.all[loc_index],
    income: incoom
  )
end

# fsas with more people
15.times do
  now_name = namer(special_names, user_name_list)
  spec_count += 1
  incoom = rand(0..150000)
  loc_index = rand(4..7)
  user = User.create!(
    name: now_name,
    email: "#{Faker::Internet.free_email}#{spec_count}",
    password: 'password',
    password_confirmation: 'password',
    gender: gender_weighted_list.sample,
    looking_for: looking_for_list.sample,
    phone: 1234567890,
    fsa: Fsa.all[loc_index],
    income: incoom
  )
end


pop_culture = {
  "Lord Of The Rings"=>["Frodo Baggins", "Aragorn", "Boromir", "Meriadoc Brandybuck", "Samwise Gamgee", "Gandalf", "Gimli", "Legolas", "Peregrin Took", "Bilbo Baggins", "Arwen", "Elrond", "Galadriel", "Eomer", "Eowyn", "Theoden", "Faramir", "Gollum", "Grima Wormtongue", "Sauron", "Saruman", "Denethor"],
  "Star Wars"=>["Luke Skywalker", "Obi-Wan Kenobi", "Han Solo", "Chewbacca", "R2-D2", "C-3PO", "Leia Organa", "Darth Vader", "Grand Moff Tarkin", "Wedge Antilles", "Yoda", "Lando Calrissian", "Boba Fett", "Jabba the Hutt", "Emperor Palpatine", "Anakin Skywalker", "Padme Amidala", "Qui-Gon Jinn", "Mace Windu", "Ahsoka Tano"],
  "The Simpsons"=>["Homer Simpson", "Marge Simpson", "Bart Simpson", "Lisa Simpson", "Maggie Simpson", "Comic Book Guy", "Apu Nahasapeemapetilon","Seymour Skinner", "Grampa Simpson", "Dr Julius Hibbert", "Waylon Smithers", "Moe Szyslak", "Fat Tony", "Ned Flanders", "Disco Stu", "Reverend Lovejoy", "Sideshow Mel", "Krusty the Clown" ],
  "Family Guy" => ["Peter Griffin", "Lois Griffin", "Meg Griffin", "Chris Griffin", "Stewie Griffin", "Brian Griffin","Glenn Quagmore", "Cleveland Brown", "Joseph Swanson", "Adam West" ],
  "Pokemon" => ["Haunter", "Gengar", "Pikachu", "Raichu", "Charmander", "Charmeleon", "Charizard", "Squirtle", "Blastoise", "Snorlax", "Scyther","Gyarados", "Alakazam", "Dragonite", "Arcanine", "Jigglypuff", "Psyduck", "Mewtwo", ],
  "Harry Potter" => ["Harry Potter", "Hermione Granger", "Ron Weasley", "Neville Longbottom", "Draco Malfoy", "Pansy Parkinson", "Lord Voldemort", "Albus Dumbledore", "Minerva McGonagall", "Severus Snape", "Gilderoy Lockhart", "Rubeus Hagrid", "Lucius Malfoy", "Bellatrix Lestrange", "Luna Lovegood", "Alastor Moody", "Sirius Black", "Remus Lupin", "Nymphadora Tonks", "Peter Pettigrew"],
  "Star Trek" => ["James T Kirk", "Spock", "Leonard McCoy", "Montgomery Scott", "Nyota Uhura", "Hikaru Sulu", "Pavel Chekov", "Christine Chapel", "Jean-Luc Picard", "William Riker", "Geordi La Forge", "Tasha Yar", "Worf", "Beverly Crusher", "Deanna Troi", "Data", "Wesley Crusher", "Guinan"],
  "Futurama" => ["Philip Fry", "Turanga Leela", "Bender Rodriguez", "Amy Wong", "Hermes Conrad", "Professor Farnsworth", "Doctor Zoidberg", "Lord Nibbler", "Zapp Brannigan", "Kif Kroker"],
  "Avengers" => ["Captain America", "Iron Man", "Thor", "Clint 'Hawkeye' Barton", "Black Widow", "Bruce Banner", "Wanda Maximoff", "Pietro Maximoff", "Vision", "Bucky Barnes", "James Rhodes", "Peter Parker", "Sam Wilson", "T'Challa", "Stephen Strange", "Scott Lang"],
  "X-Men" => ["Cyclops", "Jean Grey", "Ororo 'Storm' Munroe", "Henry 'Beast' McCoy", "Nightcrawler", "Wolverine", "Rogue", "Charles Xavier", "Magneto", "Mystique" ],
  "Justice League" => ["Batman", "Superman", "Wonder Woman", "Aquaman", "Green Lantern", "Cyborg", "The Flash", "Martian Manhunter", "Black Canary", "Green Arrow" ],
  "Disney Characters" => ["Princess Jasmine", "Aladdin", "Rapunzel", "Flynn Rider", "Snow White","Simba","Mulan", "Princess Aurora", "Cinderella","Prince Eric","Pocahontas","Elsa","Tiana", "Belle", "Ariel", "Merida", "Hercules", "Megara", "Moana", "Prince Charming"]
}

pop_culture.select! do |franchise, options|
  rearranged_list = []
  until rearranged_list.length == options.length do
      random_option = options.sample
      if rearranged_list.include?(random_option) == false
        rearranged_list << random_option
      end
    end
  options.map!.with_index {|option, index| option = rearranged_list[index] }
end

pop_culture.each do |franchise, options|
  this_survey = Survey.create!(name: franchise)
  index= 0
  while index < options.length do
    question = Question.create!(
      option_a: options[index],
      option_b: options[index + 1],
      survey: this_survey
    )
    index += 2
  end
end
