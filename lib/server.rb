require 'socket'
require 'pry'

class Server

  attr_reader :port, :client

  def initialize(port=9292)
    @tcp_server = TCPServer.new(port=9292)
    @port = port
    @counter = 0
  end

  # def create_client
  #   @tcp_server.accept
  # end

  def receive_request
    loop do

      @client = @tcp_server.accept

      puts "Ready for a request"
      request_lines = []

      while line = client.gets and !line.chomp.empty?
        request_lines << line.chomp
      end

      @counter +=1
      # client.puts "Hello World(#{@counter/2})"
      # puts "Got this request:"
      request_lines.inspect
      respond
      @client.close
    end
  end

  def format_response
    response = "<pre>" + "Hello World  (#{@counter/2})\n" + "</pre>"
    # response = "<pre>" + request_lines.join("\n") + "</pre>"
    output = "<html><head><title></title></head><body>#{response}</body></html>"
  end

  def headers
    ["http/1.1 200 ok",
    "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
    "server: ruby",
    "content-type: text/html; charset=iso-8859-1",
    "content-length: #{format_response.length}\r\n\r\n"].join("\r\n")
  end

  def respond
    @client.puts headers
    @client.puts format_response
  end
end
