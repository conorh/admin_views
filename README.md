Admin Views
=================

A Rails generator to create admin scaffolding for a model.

The generator is pretty opinionated, because I wrote this after I became tired of writing the same
code over and over. It expects that your admin controllers will reside under app/controllers/admin and
use namespaced restful routes. It also expects a base admin controller named Admin::AdminController, but
this is a single edit in the generated controller if you do not use that.

Install
-------

    gem install admin_views

This library uses the will\_paginate, formtastic and make\_resourceful gems.

Usage
-----

Create the model that you need, make sure the db table is generated too. Then:

    script/generate admin_views User

This will generate:

    app/controllers/admin/users_controller.rb
    app/views/admin/users/_form.html.erb
    app/views/admin/users/_user.html.erb
    app/views/admin/users/edit.html.erb
    app/views/admin/users/index.html.erb
    app/views/admin/users/new.html.erb
    app/views/admin/users/show.html.erb

Add the model resource route to your routes.rb. Example:

    map.namespace :admin do |admin|
      admin.resources :users
      admin.root :controller => 'users'
    end

Edit the generated index.html.erb and \_user.html.erb to only display the fields that you need.
By default they show all fields for the model. Same with the \_form.html.erb and show.html.erb.

COPYRIGHT
---------

Copyright (c) 2010 Conor Hunt <conor.hunt@gmail.com>
Released under the MIT license