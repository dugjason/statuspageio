module Statuspageio
  class Incident
    def self.list
      Statuspageio::Request.get("incidents.json")
    end

    def self.scheduled
      Statuspageio::Request.get("incidents/scheduled.json")
    end

    def self.unresolved
      Statuspageio::Request.get("incidents/unresolved.json")
    end
  end
end
