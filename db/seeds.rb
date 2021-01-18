# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
users = User.create([{ username: 'pointerish' }, { username: 'anerlo' }, { username: 'adrianux2' }, { username: 'salsita' }])
Event.create(name: 'Pointerish Event', location: 'Pointerish\'s Discord', created_by: 1, date:'2021-01-16 13:00:00')
Event.create(name: 'Anerlo Event', location: 'Anerlo\'s Discord', created_by: 2, date:'2021-01-16 14:00:00')
Event.create(name: 'Adrianux2 Event', location: 'Adrianux2\'s Discord', created_by: 3, date:'2021-01-16 19:00:00')
Event.create(name: 'Salsita Event', location: 'Salsita\'s Discord', created_by: 4, date:'2021-01-16 23:00:00')
