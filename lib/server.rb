require 'socket'

class Server

  attr_reader :port

  def initialize(port=9292)
    tcp_server = TCPServer.new(port=9292)
    @port = port
  end

  #when accept is called
  #(ie when the server sees its IP address)
  #a client obj is created that handles
  #recieving the request & sending response
  def create_client
    tcp_server.accept
  end
  #accept represents the connection to the client

end
