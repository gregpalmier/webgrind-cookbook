# webgrind-cookbook cookbook

This installs xdebug/webgrind to provide PHP developers working with a Vagrantbox tools.

# Requirements

Install Vagrant 1.2.x from the [Vagrant downloads page](http://downloads.vagrantup.com/)

Install the Vagrant Berkshelf plugin:

````
  $ vagrant plugin install vagrant-berkshelf
````

Install Berkshelf (http://berkshelf.com/):

````
  $ gem install berkshelf
````

# Usage

In your project Berksfile add:

````
cookbook "webgrind", git: "https://github.com/gregpalmier/webgrind-cookbook.git"
````

In your project Vagrantfile add:

````
chef.run_list = [
  "recipe[webgrind::webgrind]"
]
````

OR

````
chef.add_recipe "webgrind::webgrind"
````

Once cloned, run:

````
$ berks install
````

# Recipes

Default - Install Xdebug
Webgrind - Install Webgrind

# Author
- Greg Palmier (<gregpalmier@gmail.com>)
