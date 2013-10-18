Package.describe({
  summary: "Establishment collection and fixture data"
});

Package.on_use(function(api) {
  // for check()
  api.use([
    'meteor',
    'coffeescript',             // compile cs
    'deps',                     // for reactiveness
    'check',                    // for check()
    'mongo-livedata',           // for collection
    'utils'
    ], ['client', 'server']);

  // Allow us to detect 'autopublish', and publish some Meteor.users fields if
  // it's loaded.
  api.use('autopublish', 'server', {weak: true});

  api.add_files('establishments-base.coffee', ['client', 'server']);

  // for backward compat before Meteor linker changes
  if (typeof api.export !== 'undefined') {
    api.use('webapp', 'server');
    api.export('Establishment', ['client', 'server']);
    api.export('establishments', ['client', 'server']);
  }
});