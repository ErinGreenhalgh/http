require 'pry'

class Parser
  attr_reader :shutdown

  def initialize
    # @request_lines = request_lines
    @hello_counter = 0
    @total_requests = 0
    @shutdown = false
  end

  def parse_response(request_lines)
    @request_lines = request_lines
    @request_hash = convert_lines_to_hash

    if get_path == "/"
      root_response
    elsif get_path == "/hello"
      hello_response
    elsif get_path == "/datetime"
      date_time_response
    elsif get_path.include?("/word_search")
      word_search_response
    elsif get_path == "/shutdown"
      shutdown_response
    else
      puts "#{get_path} is not a valid path"
    end
    # when "/" then root_response
    # when "/hello" then hello_response
    # when "/datetime" then date_time_response
    # when [/\A\/word_search/] then word_search_response
    # when "/shutdown" then shutdown_response
    # else puts "#{get_path} is not a valid path"
    # end
  end

  def root_response
    @total_requests += 1
    "Verb: #{get_verb}\n"\
    "Path: #{get_path}\n"\
    "Protocol: #{get_protocol}\n"\
    "Host: #{get_host}\n"\
    "Port: #{get_port}\n"\
    "Origin: #{get_origin}\n"\
    "Accept: #{get_accept}"
  end

  def hello_response
    @hello_counter += 1
    @total_requests += 1
    "Hello World #{@hello_counter}"
  end

  def date_time_response
    @total_requests += 1
    Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')
  end

  def word_search_response
    @total_requests += 1
    word = get_path.split("=")[1]
    if dictionary.include?(word)
      "WORD is a known word"
    else
      "WORD is not a known word"
    end
  end

  def shutdown_response
    @total_requests += 1
    @shutdown = true
    "Total requests #{@total_requests}"
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

  def dictionary
    handle = File.readlines('/usr/share/dict/words')
    handle.map do |line|
      line.chomp
    end
  end

end
