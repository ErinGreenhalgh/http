require 'minitest/autorun'
require 'minitest/pride'
require './lib/server'
require './lib/responder'
require './lib/parser'
require 'faraday'
require 'pry'

class ServerTest < Minitest::Test
  def setup
    @server = Faraday.new(:url => 'http://127.0.0.1:9292')
  end

  def test_faraday_is_working
    response = @server.get 'http://127.0.0.1:9292'
    assert_equal 144, response.body.length
  end

  def test_it_can_show_hello
    response = @server.get 'http://127.0.0.1:9292/hello'
    assert response.body.include?("Hello World")
  end

  def test_it_can_output_datetime
    response = @server.get 'http://127.0.0.1:9292/datetime'
    assert response.body.include?("2016")
  end

  def test_it_has_newlines_to_break_up
    response = @server.get 'http://127.0.0.1:9292'
    assert response.body.include?("\n")
  end

  def test_it_can_change_output
    response = @server.get 'http://127.0.0.1:9292'
    assert_equal String, response.body.class
  end

  def test_it_will_shutdown
    skip
    response = @server.get 'http://127.0.0.1:9292/shutdown'
    assert response.body.include?("Total requests")
  end

end
