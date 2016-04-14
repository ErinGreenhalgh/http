require 'minitest/autorun'
require 'minitest/pride'
require './lib/router'
require 'pry'

class RouterTest < Minitest::Test

  def test_it_can_give_the_root_response
    router = Router.new
    assert_equal "Verb: GET
    Path: /
    Protocol: HTTP/1.1
    Host: 127.0.0.1
    Port: 9292
    Origin: 127.0.0.1
    Accept: text/html", router.root_response(request_lines)
  end

  def test_it_can_give_the_hello_response
    router = Router.new
    assert_equal "Hello World (0)", router.hello_response
  end

  def test_it_can_give_the_datetime_response
    router = Router.new
    assert_equal Time.now.strftime('%a, %e %b %Y %H:%M:%S %z'), router.date_time_response
  end

  def test_it_can_access_the_dictionary
    router = Router.new
    assert_equal Array = router.dictionary.class
  end

  def test_it_can_find_the_word_to_look_up
    router = Router.new
    assert_equal "hello",router.word_search_response
  end

  def test_it_can_find_the_word_in_the_dictionary
    router = Router.new
    router.word_search_response
    assert dictionary.include?("hello")
  end

  def test_it_can_get_the_word_search_response
    router = Router.new
    assert_equal "WORD is a known word", router.word_search_response
  end

  def test_it_can_count_the_total_number_of_requests
    router = Router.new
    #how to test this w/o running server? user faraday?
  end

  def test_it_can_give_the_shutdown_response
    router = Router.new
    assert_equal
  end

  def test_it_can_determine_the_response_given_the_path
    router = Router.new
    
  end

  def sample_lines
    ["GET /word_search?word=hello HTTP/1.1",
   "Host: 127.0.0.1:9292",
   "Connection: keep-alive",
   "Cache-Control: max-age=0",
   "Accept: text/html",
   "Upgrade-Insecure-Requests: 1",
   "User-Agent: Mozilla/5.0",
   "Accept-Encoding: gzip, deflate, sdch",
   "Accept-Language: en-US,en;q=0.8"]
  end
end
