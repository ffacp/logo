angular
  .module('<myExtensionModule>', ['openshiftConsole'])
  .run([
    'extensionRegistry',
    function(extensionRegistry) {
      extensionRegistry
        .add('nav-user-dropdown', function() {
          return [
            {
              type: 'dom',
              node: '<li class="divider"></li>'  // If you want a horizontal divider to appear in the menu
            }, {
              type: 'dom',
              node: '<li><a href="https://idp1.agileio.space/auth/realms/CP1/account/" target="_blank">Manage Account</a></li>'
            }
          ];
        });
    }
  ]);

hawtioPluginLoader.addModule('<myExtensionModule>');
