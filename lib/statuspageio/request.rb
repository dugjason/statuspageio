require 'uri'
require 'cgi'

module Statuspageio
  class Request
    def self.get(path, params = {})
      perform_request(:GET, path, params)
    end

    def self.post(path, params = {})
      perform_request(:POST, path, params)
    end

    def self.patch(path, params = {})
      perform_request(:PATCH, path, params)
    end

    def self.put(path, params = {})
      perform_request(:PUT, path, params)
    end

    def self.delete(path, params = {})
      perform_request(:DELETE, path, params)
    end

  private
    def self.perform_request(method, path, params = {})
      if !Statuspageio.oauth_token.nil?
        auth_details = "OAuth: #{Statuspageio.oauth_token}"
      elsif !Statuspageio.api_key.nil?
        auth_details = Statuspageio.api_key
      else
        auth_details = nil
      end

      headers = {}
      headers.update(
        authorization: auth_details
      )

      url = Statuspageio.api_base + 'pages/' + Statuspageio.page + '/' + path

      case method
      when :GET, :DELETE
        url += "#{URI.parse(url).query ? '&' : '?'}#{encode params}"
        payload = nil
      else
        payload = params
      end

      options = {
        headers: headers,
        method: method,
        payload: payload,
        url: url
      }

      # TODO Add error handling and a way to expose response codes, etc
      RestClient::Request.execute options
    end

    def self.encode(params)
      params.collect { |param, value| [param, CGI.escape(value.to_s)].join('=') }.join('&')
    end
  end
end
