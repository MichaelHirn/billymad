require 'spec_helper'

describe Billymad do

  describe "defaults" do
    it 'has billomat id unset' do
      expect(Billymad.configuration.billomat_id).to be_nil
    end

    it 'has api key unset' do
      expect(Billymad.configuration.api_key).to be_nil
    end

    it 'has api format as json' do
      expect(Billymad.configuration.api_format).to eq(:json)
    end

    it 'has http requests via SSL' do
      expect(Billymad.configuration.secure).to be_true
    end

    it 'has Logger as default logger' do
      expect(Billymad.configuration.logger).to be_instance_of(Logger)
    end
  end
  
  describe "configure via block" do
    before(:all) do
      Billymad.configure do |config|
        config.billomat_id = 'id'
        config.api_key     = 'api-key'
        config.api_format  = :xml
        config.secure      = false
        config.logger      = FakeLogger.new
      end
    end
    
    it 'allows to set billomat id' do
      expect(Billymad.configuration.billomat_id).to eq('id')
    end

    it 'allows to set api key' do
      expect(Billymad.configuration.api_key).to eq('api-key')
    end

    it 'allows to set api format' do
      expect(Billymad.configuration.api_format).to eq(:xml)
    end

    it 'allows to do http requests without SSL' do
      expect(Billymad.configuration.secure).to be_false
    end

    it 'allows to choose a logger' do
      expect(Billymad.configuration.logger).to eq(FakeLogger.new)
    end
  end

end