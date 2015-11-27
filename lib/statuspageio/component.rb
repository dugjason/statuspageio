module Statuspageio
  class Component
    ##
    # List all components
    def self.list
      Statuspageio::Request.get("components.json")
    end

    ##
    # Update a component
    # name - The name of the component
    # status - The status, one of operational|degraded_performance|partial_outage|major_outage. To
    #   set a 3rd party component back to its official status, pass in a blank
    #   string ("component[status]=")
    def self.update(id:, name:, status: '')
      params = {
        "component[name]": name,
        "component[status]": status
      }
      Statuspageio::Request.patch("components/#{id}.json", params)
    end
  end
end
