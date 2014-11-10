require_relative 'server'
require 'minitest/autorun'
require 'minitest/spec'

include Rack::Test::Methods

def app
    Sinatra::Application
end

describe 'my example server' do
    it 'should succeed' do
        get '/'
        last_response.status.must_equal 200
        last_response.must_be :ok?
        last_response.body.must_include 'hello world'
    end
end
