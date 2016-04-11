require 'socket'

class Server

  attr_reader :port, :client

  def initialize(address, port)
    server = TCPServer.new(address, port=9292)
  end

  #when accept is called
  #(ie when the server sees its IP address)
  #a client obj is created that handles
  #recieving the request & sending response
  def accept
    Client.new
  end


end
