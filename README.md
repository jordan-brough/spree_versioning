SpreeVersioning
===============

This extension is a thin wrapper around the [PaperTrail](https://github.com/airblade/paper_trail) gem.  It supports auditing and versioning of all spree models out of the box.  The set of models to track can also be easily customized if versioning of only a subset is desired.

Installation
------------

Add spree_versioning to your Gemfile:

```ruby
gem 'spree_versioning'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_versioning:install
```

Create an initializer file `config/initializers/spree_versioning.rb` with the following code.  SpreeVersioning by default adds versioning to all spree core models that inherit from ActiveRecord::Base.  To customize this set, add models to the arrays passed to the config.include or config.exclude methods as neccessary.

```ruby
SpreeVersioning.configure do |config|
	config.include [Spree::ModelA] # Add versioning to ModelA
	config.exlude  [Spree::ModelB] # Remove versioning from ModelB
end

SpreeVersioning.track_models
```

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_versioning/factories'
```

Copyright (c) 2014 [name of extension creator], released under the New BSD License
