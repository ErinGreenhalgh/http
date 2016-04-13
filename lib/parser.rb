class Parser

  def initialize(request_lines = [])
    @request_lines = request_lines
  end

  def get_hash_of_request_lines
    @request_lines.shift
    @request_lines.map do |line|
      line.split(": ")
    end.to_h
  end

  def method_name
    first_line = @request_lines[0].split(" ")
    verb = first_line[0]
    path = first_line[1]
    protocol = first_line[2]
    #add these to our hash
  end


  def get_host
    get_hash_of_request_lines["Host"][0..8]
  end

  def get_port
    get_hash_of_request_lines["Host"][-4..-1]
  end

  def get_origin
    get_hash_of_request_lines["Host"][0..8]
  end

  def get_accept
    get_hash_of_request_lines["Accept"]
  end



  #umbrella method to puts all other method outcomes in the right format
end
