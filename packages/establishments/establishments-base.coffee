#Setup Class and Collection
#--------------------------
#
#The first thing we will do is set up a class with a constructor

class Establishment
  constructor: (name) ->
    check(name, String)

    @name = name

#And now that we have a class, we can create our collection, this will set up a document collection in
#the db and create a repository to access documents from db. We will also pass it an object with
#a transform handler. The transform handler will take the documents returned from the repository and
#transform them into the class it should be.

establishments = new Meteor.Collection('establishments', {
  transform: (doc) ->
    return new Establishment(doc.name);
})

#And finally, we'll add some fixture data so we can get things working quickly.

if establishments.find().count() is 0
  for i in [0..20] by 1
    if i%4 is 0
      establishments.insert
        name: "Premium Bar #{i}"
        premium: true
        phoneNumber: "#{Meteor.utils.getRandomPhoneNumber()}"
        address: "#{Meteor.utils.getRandomInt(1, 1500)} 2nd Ave."
        crossroads:
          eastwest: "2nd Ave"
          northsouth: "#{Meteor.utils.getRandomInt(1,19)} St"
        neighborhood: 'Lower East Side'
        style: 'bar'
        openHour: '3pm'
        closeHour: '4am'
        happyHours: [
          description: 'Monday Madness! 2 for 1 Beers!'
          days: ['Monday']
          startHour: '3pm'
          endHour: '7pm'
          ,
          description: 'Thirsty Thursday! $2 draught!'
          days: ['Tuesday']
          startHour: 'open'
          endHour: 'close'
        ]
    else
      establishments.insert
        name: "Generic Bar #{i}"
        premium: true
        phoneNumber: "#{Meteor.utils.getRandomPhoneNumber()}"
        address: "#{Meteor.utils.getRandomInt(1, 1500)} 2nd Ave."
        crossroads:
          eastwest: "2nd Ave"
          northsouth: "#{Meteor.utils.getRandomInt(1,19)} St"
        neighborhood: 'Lower East Side'
        style: 'bar'
        openHour: '3pm'
        closeHour: '4am'
        happyHours: [
          description: 'Monday Madness! 2 for 1 Beers!'
          days: ['Monday']
          startHour: '3pm'
          endHour: '7pm'
          ,
          description: 'Thirsty Thursday! $2 draught!'
          days: ['Tuesday']
          startHour: 'open'
          endHour: 'close'
        ]

