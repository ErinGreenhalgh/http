require 'pry'

class Client

  # attr_reader :request_lines

  # def initialize
  #   @request_lines = []
  # end

  def get_input
    puts "Ready for a request"
    if request_lines = []
      while line = gets and !line.chomp.empty?
        request_lines << line.chomp
      end
    else
      request_lines.inspect
    end 
  end


  def confirm_request
    puts "Got this request:"
    get_input.inspect
  end

end
