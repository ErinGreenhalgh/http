require 'socket'
require './lib/responder'
require './lib/parser'
# require './lib/router'
require 'pry'

class Server

  def initialize
    @tcp_server = TCPServer.new(9292)
    listen
  end


  def listen
    loop do
      client = @tcp_server.accept

      get_request_lines
      parsed = Parser.new(get_request_lines)
      routed = Router.new(path)
      responder = Responder.new(routed)

      


      client.close
    end
  end

  private

  def get_request_lines
    request_lines = []
    while client.gets and !line.chomp.empty?
      request_lines << lines.chomp
    end
  end


end
