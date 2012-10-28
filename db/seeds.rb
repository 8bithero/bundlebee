# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'CREATING USERS'
andreas = User.create! :email => 'andreas@example.com', :password => 'broomstick', :password_confirmation => 'broomstick'
puts 'New user created: ' << andreas.email
paris   = User.create! :email => 'paris@example.com',   :password => 'broomstick', :password_confirmation => 'broomstick'
puts 'New user created: ' << paris.email
vasilis = User.create! :email => 'vasilis@example.com', :password => 'broomstick', :password_confirmation => 'broomstick'
puts 'New user created: ' << vasilis.email


puts 'CREATING APPS'
apps = App.create([{ name: 'Angry Birds',   bundle_id: 'com.rovio.angry_birds' },
                   { name: 'Cut The Rope',  bundle_id: 'com.zeptolab.cut_the_rope' },
                   { name: 'Temple Run',    bundle_id: 'com.imangi.temple_run' },
                   { name: 'Fruit Ninja',   bundle_id: 'com.halfbrick.fruit_ninja' },
                   { name: 'Doodle Jump',   bundle_id: 'com.gamehouse.doodle_jump' },
                   { name: 'Worms',         bundle_id: 'com.ea.worms' },
                   { name: 'World Of Goo',  bundle_id: 'com.2dboy.goo' }])
apps.each { |app| puts 'New app created: ' << app.name }
