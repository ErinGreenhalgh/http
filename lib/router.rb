require './lib/parser'
require 'pry'

class Router

  def initialize
    @parser = Parser.new(request_lines)
  end

  def root_response
    if @parser.get_path == "/"
      "Verb: #{@parser.get_verb}\n"\
      "Path: #{@parser.get_path}\n"\
      "Protocol: #{@parser.get_protocol}\n"\
      "Host: #{@parser.get_host}\n"\
      "Port: #{@parser.get_port}\n"\
      "Origin: #{@parser.get_origin}\n"\
      "Accept: #{@parser.get_accept}"
    end
    #implicit nil?
  end
end
