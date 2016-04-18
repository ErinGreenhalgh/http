require 'pry'

class Parser

  attr_reader :request_lines

  def initialize(request_lines)
    @request_lines = request_lines
  end

  def create_hash
    @request_lines[1..-1].map do |line|
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
    create_hash["Host"].split(":")[0]
  end

  def get_port
    create_hash["Host"].split(":")[1]
  end

  def get_origin
    create_hash["Host"].split(":")[0]
  end

  def get_accept
    create_hash["Accept"]
  end


end
