class Client

  def get_input
    puts "Ready for a request"
    request_lines = []
    while line = gets and !line.chomp.empty?
      request_lines << line.chomp
    end
  end

  # def method_name
  #
  # end
end
