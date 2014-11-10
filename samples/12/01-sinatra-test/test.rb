require_relative 'server'
require 'minitest/autorun'

class HelloWorldTest < MiniTest::Test
    include Rack::Test::Methods

    def app
        Sinatra::Application
    end

    def test_get_root
        get '/'
        assert_equal 200, last_response.status
        assert last_response.ok?
        assert_equal 'hello world', last_response.body
    end
end
