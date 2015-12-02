require 'statuspageio'

class AuthExample
  def initialize
    # Set your statuspage.io Page hash and either your OAuth token or API Key. These values should
    #   all be provided as Strings.
    # You can find these values by logging into your StatusPage.io account, and hitting "Manage
    #   Account", then into the "API" tab
    Statuspageio.page = 'gadi7g3q7h'
    Statuspageio.oauth_token = nil
    Statuspageio.api_key = '87621391-1286735127-12387613-123876123'
  end
end
