require './lib/parser'
require 'pry'

class Router

  def initialize
    @parser = Parser.new
  end

  def root_response
    if @parser.get_path == "/"
      
  end
end
