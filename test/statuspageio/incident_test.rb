require 'test_helper'

describe 'Statuspageio::Incident' do
  before do
    VCR.use_cassette('incident/setup') do
      AuthExample.new
    end
  end
  ##
  # List Incidents
  #
  describe '#list' do
    it 'lists incidents' do
      VCR.use_cassette('incident/list/success') do
        response = Statuspageio::Incident.list
        assert JSON.parse(response).is_a?(Array)
      end
    end

    it 'accepts no arguments' do
      assert_raises ArgumentError do
        Statuspageio::Incident.list('junk')
      end
    end
  end

  ##
  # List scheduled Incidents
  #
  describe '#scheduled' do
    it 'lists scheduled incidents' do
      VCR.use_cassette('incident/scheduled/success') do
        response = Statuspageio::Incident.scheduled
        assert JSON.parse(response).is_a?(Array)
      end
    end

    it 'accepts no arguments' do
      assert_raises ArgumentError do
        Statuspageio::Incident.scheduled('junk')
      end
    end
  end

  ##
  # List unresolved Incidents
  #
  describe '#unresolved' do
    it 'lists unresolved incidents' do
      VCR.use_cassette('incident/unresolved/success') do
        response = Statuspageio::Incident.unresolved
        assert JSON.parse(response).is_a?(Array)
      end
    end

    it 'accepts no arguments' do
      assert_raises ArgumentError do
        Statuspageio::Incident.unresolved('junk')
      end
    end
  end
end
