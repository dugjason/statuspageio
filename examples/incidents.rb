require 'statuspageio'
require File.expand_path('./../../examples/auth', __FILE__)

begin
  AuthExample.new

  puts "\nGet a list of all incidents"
  puts Statuspageio::Incident.list

  puts "\nGet all unresolved incidents"
  unresolved = Statuspageio::Incident.unresolved
  puts unresolved
  puts " ^^^ You'll receive an empty array if you have no unresolved incidents" if unresolved == "[]"
end
