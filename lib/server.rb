require 'socket'
require './lib/parser'
require './lib/router'
require './lib/responder'
require 'pry'

class Server

  attr_reader :client, :parser, :router, :responder

  def initialize
    @tcp_server = TCPServer.new(port=9292)
    @parser = Parser.new
    @router = Router.new
    @responder = Responder.new
    listen
  end

  def listen
    loop do

      @client = @tcp_server.accept
      request_lines = []

      while line = client.gets and !line.chomp.empty?
        request_lines << line.chomp
      end

      parsed = parser.parse_response(request_lines)
      routed = router.determine_response(parsed)
      responder.give_response(@client, routed)

      if router.shutdown
        break
      end

      @client.close

    end
  end


end
