Meteor.utils = {}

# Returns a random number between min and max
Meteor.utils.getRandomArbitary = (min, max) ->
  return Math.random() * (max - min) + min;

# Returns a random integer between min and max
# Using Math.round() will give you a non-uniform distribution!
Meteor.utils.getRandomInt = (min, max) ->
  return Math.floor(Math.random() * (max - min + 1)) + min;

Meteor.utils.getRandomPhoneNumber = () ->
  return "#{Meteor.utils.getRandomInt(100, 999)}-#{Meteor.utils.getRandomInt(100, 999)}-#{Meteor.utils.getRandomInt(1000, 9999)}"