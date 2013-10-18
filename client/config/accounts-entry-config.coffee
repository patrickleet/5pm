Meteor.startup ->
  Accounts.ui.config(
    passwordSignupFields: 'EMAIL_ONLY'
  )

Meteor.startup ->
  AccountsEntry.config = {
    logo: false,
    privacyUrl: '/privacy-policy',
    termsUrl: '/terms-of-use',
    homeRoute: 'home',
    dashboardRoute: 'dashboard',
    profileRoute: 'profile'
    defaultProfile:
      someDefault: 'default'
  }