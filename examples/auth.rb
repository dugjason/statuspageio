require 'statuspageio'

class AuthExample
  def initialize
    # Set your statuspage.io Page hash and either your OAuth token or API Key. These values should
    #   all be provided as Strings.
    # You can find these values by logging into your StatusPage.io account, and hitting "Manage
    #   Account", then into the "API" tab
    Statuspageio.page = nil
    Statuspageio.oauth_token = nil
    Statuspageio.api_key = nil
  end
end
