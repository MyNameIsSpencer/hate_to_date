# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Restaurant.destroy_all
Reservation.destroy_all



fsa_list = ['M3A',	'M4A',	'M5A',	'M6A',	'M7A',	'M9A',
'M1B',	'M3B',	'M4B',	'M5B',	'M6B'	'M9B'
'M1C',	'M3C',	'M4C',	'M5C',	'M6C'	'M9C'
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

walla = User.create(name: 'Walla', email: 'wallaha@w..co', password: '1234', gender: 'female', phone: '1234567890', fsa: fsa_list.sample)
puter = User.create(name: 'Puter', email: 'pupu@ter.co', password: '1234', gender: 'male', phone: '7563625243', fsa: fsa_list.sample)
miketa = User.create(name: 'Mike Ta', email: 'miket@tata.co', password: '1234', gender: 'male', phone: '0096847566', fsa: fsa_list.sample)
rulshshsh = User.create(name: 'Rulshshsh', email: 'rul@shsh.co', password: '1234', gender: 'male', phone: '2253648881', fsa: fsa_list.sample)
hammerhead = User.create(name: 'Hammer Head', email: 'hammer@time.co', password: '1234', gender: 'female', phone: '1110002228', fsa: fsa_list.sample)
zedder = User.create(name: '@##!!-z', email: '...@zi...', password: '1234', gender: 'female', phone: '8489069473', fsa: fsa_list.sample)
beatrices = User.create(name: 'BEATRICES!', email: 'be@trice.co', password: '1234', gender: 'female', phone: '1829384756', fsa: fsa_list.sample)
awesomeduck = User.create(name: 'Awesome Duck26', email: 'awesome@duck.co', password: '1234', gender: 'male', phone: '8844775563', fsa: fsa_list.sample)
winchester = User.create(name: 'WinchESTer', email: 'winch@ester.co', password: '1234', gender: 'male', phone: '0192837465', fsa: fsa_list.sample)
classic = User.create(name: 'cLASSIC', email: 'clas@sic', password: '1234', gender: 'female', phone: '3339994852', fsa: fsa_list.sample)
dasher = User.create(name: '--__--', email: '-!-__-!-', password: '1234', gender: '', phone: '8883746666', fsa: fsa_list.sample)



# bootom
