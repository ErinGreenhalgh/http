require 'simplecov'
SimpleCov.start

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

  # def test_faraday_is_working
  #   response = @server.get 'http://127.0.0.1:9292'
  #   assert_equal 144, response.body.length
  # end

  def test_it_can_get_request_lines
    response = @server.get 'http://127.0.0.1:9292'
    assert_equal 144, response.body.length
  end

  def test_it_can_get_information_from_the_parser

  end

  def test_it_can_get_information_from_the_responser

  end

  def test_it_can_get_information_from_the_router

  end

  def test_it_can_get_information_from_router

  end

  def test_it_can_send_a_response

  end
end
