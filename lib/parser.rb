require 'pry'

class Parser

  attr_reader :request_lines

  # def initialize(request_lines)
  #   @request_lines = request_lines
  # end

  def create_hash(request_lines)
    @request_lines = request_lines
    @requat_lines[1..-1].map do |line|
      line.split(": ")
    end.to_h
  end

  def parse_first_line(request_lines)
    create_hash(request_lines)
    first_line = @request_lines[0].split(" ")
    verb = first_line[0]
    path = first_line[1]
    protocol = first_line[2]
    {"Verb" => verb, "Path" => path, "Protocol" => protocol}
  end

  def get_verb
    parse_first_line(request_lines)["Verb"]
  end

  def get_path
    parse_first_line(request_lines)["Path"]
  end

  def get_protocol
    parse_first_line(request_lines)["Protocol"]
  end

  def get_host
    create_hash(request_lines)["Host"].split(":")[0]
  end

  def get_port
    create_hash(request_lines)["Host"].split(":")[1]
  end

  def get_origin
    create_hash(request_lines)["Host"].split(":")[0]
  end

  def get_accept
    create_hash(request_lines)["Accept"]
  end


end
