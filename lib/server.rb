require 'socket'
require 'pry'

class Server

  attr_reader :port

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

      client = @tcp_server.accept

      puts "Ready for a request"
      request_lines = []

      while line = client.gets and !line.chomp.empty?
        request_lines << line.chomp
      end

      @counter +=1
      client.puts "Hello World(#{@counter/2})"
      puts "Got this request:"
      request_lines.inspect
      client.close
    end
  end

  def format_response
    response = "<pre>" + request_lines.join("\n") + "</pre>"
    output = "<html><head></head><body>#{response}</body></html>"
  end

  def headers
    ["http/1.1 200 ok",
    "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
    "server: ruby",
    "content-type: text/html; charset=iso-8859-1",
    "content-length: #{format_output.length}\r\n\r\n"].join("\r\n")
  end

  def format_response
    "<pre>" + request_lines.join("\n") + "</pre>"
  end

  def format_output
    "<html><head></head><body>#{format_response}</body></html>"
  end

  puts "Sending response."


  #formats the response into html
  # headers = ["http/1.1 200 ok",
  #           "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
  #           "server: ruby",
  #           "content-type: text/html; charset=iso-8859-1",
  #           "content-length: #{output.length}\r\n\r\n"].join("\r\n")
  #           #output.length = the number
  # client.puts headers
  # client.puts output
  #
  # puts ["Wrote this response:", headers, output].join("\n")
  # client.close
  # #close the server object after it it has given its reponse
  # puts "\nResponse complete, exiting."

end
