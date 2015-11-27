require 'statuspageio'
require File.expand_path('./../../examples/auth', __FILE__)

begin
  AuthExample.new

  puts "\nGet a list of all Components"
  components = Statuspageio::Component.list
  puts components

  component = JSON.parse(components).first
  puts "\nUpdate a component with ID: #{component['id']}"
  puts Statuspageio::Component.update(
    id: component['id'],
    name: component['name'] + " updated",
    status: 'operational'
  )
end
