# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

User.create([{ :username => 'rosscompwiz'}, {:firstname => 'Ross'},
    {:lastname => 'Money'}, { :user_type => 'Office Staff'}, {:hashed_password => '47i44'}])

User.create([{ :username => 'jbloggs'}, {:firstname => 'Joe'},
    {:lastname => 'Bloggs'}, { :user_type => 'Employee'}, {:hashed_password => '47i44'}])

Car.create([{:make => 'Ford'}, {:model => 'Fiesta TY400'}, {:registration => 'KL6273'},
    {:servicedue => '2013-06-05'}, {:lastservice => '2012-06-05'}, {:bookingtype => 'longterm'},
    {:longtermassigned => true }])

Lease.create([{:username => 'jbloggs'}, {:registration => 'KL6273'},
    {:startdate => '2012-05-06'}, {:enddate => '2013-05-06'}])

User.create([{ :username => 'samhodge'}, {:firstname => 'Sam'},
    {:lastname => 'Hodge'}, { :user_type => 'Employee'}, {:hashed_password => '47i44'}])

Car.create([{:make => 'Honda'}, {:model => 'MX123'}, {:registration => 'FG62S3'},
    {:servicedue => '2012-03-05'}, {:lastservice => '2011-03-05'}, {:bookingtype => 'pool'}])

DayBooking.create([{:username => 'samhodge'}, {:registration => 'FG62S3'},
    {:day => '2012-04-07'}])






