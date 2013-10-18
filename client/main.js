App = {
  subs: {
    notifications: Meteor.subscribe('notifications')
    , interests: Meteor.subscribe('interests')
    , inquiries: Meteor.subscribe('inquiries')
    , inquiry: Meteor.subscribe('inquiry')
    , interest: Meteor.subscribe('interest')
  }
}
