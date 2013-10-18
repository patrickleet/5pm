clearErrors = function() {
  Meteor.errors.remove({seen: true});
}
checkAuthorized = function() {
  var routeName = this.context.route.name;
  // no need to check at these URLs
  if (_.include([
    'passwordReset',
    'notFound',
    'loading',
    'entryForgotPassword',
    'entrySignIn',
    'entrySignUp',
    'home'
  ], routeName))
    return;

  var user = Meteor.user();
  if (! user) {
    this.render(Meteor.loggingIn() ? this.loadingTemplate : 'entrySignIn');
    this.render({
      'header': {to: 'header'},
      'footer': {to: 'footer'}
    });
    return this.stop();
  }
}

Router.configure({
  layout: 'layout',
  loadingTemplate: 'loading',
  notFoundTemplate: 'notFound',
  renderTemplates: {
    'header': { to: 'header' }
    , 'footer': { to: 'footer'}
  },
  before: [clearErrors, checkAuthorized]
});

Router.map(function () {
  this.route('notFound');
  this.route('home', {
    path: '/'
  });
});

