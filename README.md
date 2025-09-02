# Namespaced Routes Lab

## Objectives

1. Organize controllers using a module.
2. Use namespaced routes.

## Overview

We're going to add some administrative functions to our song library.
Using what we learned about namespaced routes and module scope, we'll
organize our controllers and routes under an `admin` namespace to keep
them separate from the regular user functions.

## Instructions

The base application has been provided with tests. Make sure to run
`bin/rails db:seed` to set up seed data. Tests can be run with `bin/rspec`.

**Note:** Since we're building new features on an existing project that
already has tests, part of the job is to make sure the tests that
already pass at the beginning still pass when you're done!

1. Create a migration and a model for a `Preference` class that will store
   preferences for the app. In the migration, define `boolean` fields for:
   - `allow_create_songs`: Allows for creation of new songs. Used to control
     the ability to add new songs to the system.
   - `allow_create_artists`: Allows for creation of new artists. Used to control
     the ability to add new artists to the system.
   - **Note:** There will only be 1 instance of `Preference`, not a preference
     associated with each artist/song. After creating the model, run
     `bin/rails preferences:load` so that your code will work in the browser. This
     will run the Rake task defined in the `lib/tasks/preferences.rake` file and
     save one `Preference` instance to the database.
2. Create a `PreferencesController`, routes, and views. Do this under an `Admin`
   module to separate it from the standard user functionality.
3. Update the `songs#new` and `artists#new` actions to check that creating new
   songs or artists is enabled using the `Preference` class, and redirect to
   `/songs` and `/artists`, respectively, if that preference is disabled. If the
   preference is enabled, show the `new` view instead.
   - **Hint**: Remember, there will only be one instance of the `Preference`
     class saved to the database. When determining if creating songs or artists
     is enabled, you'll need to find the **first** instance of the `Preference`
     class, and use that instance along with some conditional logic to determine
     whether to redirect or display the view.
4. Make sure tests pass.
