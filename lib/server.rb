require 'socket'
require './lib/responder'
require './lib/parser'
require 'pry'

class Server

  attr_reader :client, :responder

  def initialize
    @tcp_server = TCPServer.new(port=9292)
    @responder = Responder.new
    @parser = Parser.new
    listen
  end

  def listen
    loop do

      @client = @tcp_server.accept
      request_lines = []

      while line = client.gets and !line.chomp.empty?
        request_lines << line.chomp
      end

      responder.give_response(@client, @parser.parse_response(request_lines))

      if @parser.shutdown
        break
      end

      @client.close

    end
  end


end
