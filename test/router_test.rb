require 'minitest/autorun'
require 'minitest/pride'
require './lib/router'
require './lib/parser'
require 'pry'

class RouterTest < Minitest::Test
  def setup
    @router = Router.new
    @router.determine_response
  end

  def test_it_can_determine_which_reponse_to_send

  end

  def sample_lines
    ["GET / HTTP/1.1",
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
