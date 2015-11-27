$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'statuspageio'

require File.expand_path('./../../examples/auth', __FILE__)
require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = File.join(File.dirname(__FILE__), 'fixtures', 'cassettes')
  c.default_cassette_options = {
    record:                     :new_episodes,
    decode_compressed_response: true,
    serialize_with:             :json,
    preserve_exact_body_bytes:  true
  }
  c.hook_into :webmock
  c.filter_sensitive_data('<AUTH_TOKEN>') { |interaction| interaction.request.headers['Authorization'].first }
end

include WebMock::API
