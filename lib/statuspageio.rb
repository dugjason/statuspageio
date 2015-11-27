# Gems
require 'rest-client'

# Version
require 'statuspageio/version'

# Resources
require 'statuspageio/request'
require 'statuspageio/incident'
require 'statuspageio/component'


module Statuspageio
  @api_base = 'https://api.statuspage.io/v1/'

  class << self
    attr_accessor :api_base, :page, :oauth_token, :api_key
  end
end
