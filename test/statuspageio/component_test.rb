require 'test_helper'

describe 'Statuspageio::Component' do
  before do
    AuthExample.new
  end
  ##
  # List Components
  #
  describe '#list' do
    it 'lists components' do
      VCR.use_cassette('component/list/success') do
        response = Statuspageio::Component.list
        assert JSON.parse(response).is_a?(Array)
      end
    end

    it 'accepts no arguments' do
      assert_raises ArgumentError do
        Statuspageio::Component.list('junk')
      end
    end
  end

  ##
  # Update Component
  #
  describe '#update' do
    it 'updates a component' do
      VCR.use_cassette('component/update/success') do
        component = JSON.parse(Statuspageio::Component.list).first
        updated_component = Statuspageio::Component.update(
          id: component['id'],
          name: component['name'] + " updated",
          status: 'operational'
        )
        assert JSON.parse(updated_component)['name'] == component['name'] + " updated"
        assert JSON.parse(updated_component)['status'] == 'operational'
        assert JSON.parse(updated_component).is_a?(Object)
      end
    end
  end
end
