require 'socket'
require './lib/responder'
require './lib/parser'
require 'pry'

class Server

  attr_reader :port, :client, :request_lines, :counter, :responder

  def initialize
    @tcp_server = TCPServer.new(port=9292)
    @port = port
    @responder = Responder.new
    @counter = 0
    listen
  end

  def listen
    loop do

      @client = @tcp_server.accept
      request_lines = []

      while line = client.gets and !line.chomp.empty?
        request_lines << line.chomp
      end

      @parser = Parser.new(request_lines)


      # @request_lines.inspect
      # binding.pry
      responder.give_response(@client, @parser.parse_response)
      # responser.format_first_request_line(@request_lines)
      @client.close

    end
  end


end
