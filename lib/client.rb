require 'pry'

class Client

  def get_input
    puts "Ready for a request"
    request_lines = []
    while line = gets and !line.chomp.empty?
      request_lines << line.chomp
    end
    request_lines
  end


  def confirm_request
    puts "Got this request:"
    get_input.inspect
  end

end
