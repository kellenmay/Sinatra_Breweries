require 'pry'

require 'bundler' #this will load the Gemfile
Bundler.require #run bundle and gemfile.lock will show it worked
 
require_relative './lib/brewery_cli/breweries'
require_relative './lib/brewery_cli/cli'
require_relative './lib/brewery_cli/api'



