require 'pry'

class Parser

  def initialize(request_lines = [])
    @request_lines = request_lines
    @request_hash = convert_lines_to_hash
    @counter = 0
  end

  def parse_response
    case get_path
    when "/" then root_response
    when "/hello" then "YO"#hello_response
    end
  end

  def root_response
    "Verb: #{get_verb}\n"\
    "Path: #{get_path}\n"\
    "Protocol: #{get_protocol}\n"\
    "Host: #{get_host}\n"\
    "Port: #{get_port}\n"\
    "Origin: #{get_origin}\n"\
    "Accept: #{get_accept}"
  end

  def hello_response
    @counter += 1
    "Hello World #{@counter}"
  end

  def convert_lines_to_hash
    thing = @request_lines[1..-1]
    thing.map do |line|
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

  # def merge_hash
  #   @request_hash.merge(@first_line_hash)
  #   binding.pry
  # end

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



  # def parse_response
  #   # binding.pry
  #   "Verb: #{get_verb}"\
  #   "Path: #{get_path}"\
  #   "Protocol: #{get_protocol}"\
  #   "Host: #{get_host}"\
  #   "Port: #{get_port}"\
  #   "Origin: #{get_origin}"\
  #   "Accept: #{get_accept}"
  # end

  #umbrella method to puts all other method outcomes in the right format
end
