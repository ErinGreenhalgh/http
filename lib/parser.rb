require 'pry'

class Parser

  def initialize

  end

  def parse_response(request_lines)
    @request_lines = request_lines
    @request_hash = convert_lines_to_hash
    # determine response
  end

  def convert_lines_to_hash
    lines = @request_lines[1..-1]
    lines.map do |line|
      line.split(": ")
    end.to_h
  end


  def parse_first_line
    first_line = @request_lines[0].split(" ")
    verb = first_line[0]
    path = first_line[1]
    protocol = first_line[2]
    first_line_hash = {"Verb" => verb, "Path" => path, "Protocol" => protocol}
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
    @request_hash["Host"][0..8]
  end

  def get_port
    @request_hash["Host"][-4..-1]
  end

  def get_origin
    @request_hash["Host"][0..8]
  end

  def get_accept
    @request_hash["Accept"]
  end
end
