require 'minitest/autorun'
require 'minitest/pride'
require './lib/response_information'

class ResponseInformationTest < Minitest::Test
  def test_it_can_get_the_verb
    router = Router.new(sample_lines)
    assert_equal "GET", router.get_verb
  end

  def test_it_can_get_the_path
    router = Router.new(sample_lines)
    assert_equal "/", router.get_path
  end

  def test_it_can_get_the_protocol
    router = Router.new(sample_lines)
    assert_equal "HTTP/1.1", router.get_protocol
  end

  def test_it_can_get_the_host
    router = Router.new(sample_lines)
    assert_equal "127.0.0.1", router.get_host
  end

  def test_it_can_get_the_port
    router = Router.new(sample_lines)
    assert_equal "9292", router.get_port
  end

  def test_it_can_get_the_origin
    router = Router.new(sample_lines)
    assert_equal "127.0.0.1", router.get_origin
  end

  def test_it_can_get_the_accept_data
    router = Router.new(sample_lines)
    assert_equal "text/html", router.get_accept
  end
end
