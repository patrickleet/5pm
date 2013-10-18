Package.describe({
  summary: "utils"
});

Package.on_use(function(api) {
  // for check()
  api.use([
    'standard-app-packages',
    'coffeescript'
    ], ['client', 'server']);

  api.add_files('utils.coffee', ['client', 'server']);
});