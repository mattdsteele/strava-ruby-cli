require 'spec_helper'

describe Strava do
  describe 'auth' do
    it 'shuts down server when launchy fails' do
      options = { client_id: 'foo', client_secret: 'bar' }
      expect(Launchy).to receive(:open).and_yield('failed')
      auth = Strava::Cli::Auth.new(options)
      # expect(auth.access_token).to raise_error
      begin
        auth.access_token
      rescue RuntimeError => err
        expect(err.message).to match(/failed/)
      end
    end
  end
end
