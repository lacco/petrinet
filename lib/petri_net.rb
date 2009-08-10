$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'
require 'couchrest'

module PetriNet
  VERSION = '0.0.1'
  DB = CouchRest.database!("http://127.0.0.1:5984/pnengine")
end

require 'petri_net/helpers/element'
Dir.glob("lib/petri_net/**/*.rb").each do |file|
  require file
end
