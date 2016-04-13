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

  def parse_first_line
    first_line = @request_lines[0].split(" ")
    verb = first_line[0]
    path = first_line[1]
    protocol = first_line[2]
    {"Verb" => verb, "Path" => path, "Protocol" => protocol}
  end

  def get_verb
    parse_first_line["Verb"]
  end

  def get_path
    parse_first_line["Path"]
  end

  def get_protocol
    parse_first_line["Protocol"]
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

  def parse_response
    "Verb: #{get_verb}
    Path: #{get_path}
    Protocol: #{get_protocol}
    Host: #{get_host}
    Port: #{get_port}
    Origin: #{get_origin}
    Accept: #{get_accept}"
  end


  #umbrella method to puts all other method outcomes in the right format
end
