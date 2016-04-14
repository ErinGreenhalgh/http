require './lib/response_information'

class Router
  include ResponseInformation

  attr_reader :total_requests

  def initialize
    # @request_lines = request_lines
    @hello_counter = 0
    @total_requests = 0
    @shutdown = false
    @responder = Responder.new
  end

  def determine_path(get_path)
    if get_path == "/"
      @responder.give_response(client, root_response)
    elsif get_path == "/hello"
      hello_response
    elsif get_path == "/datetime"
      date_time_response
    elsif get_path.include?("/word_search")
      word_search_response
    elsif get_path == "/shutdown"
      shutdown_response
    else
      puts "'#{get_path}' is not a valid path"
    end
    #case statements instead?
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

  def word_search_response(get_path="/word_search?word=hello")
    @total_requests += 1
    word = get_path.split("=")[1]
    if dictionary.include?(word)
      "WORD is a known word"
    else
      "WORD is not a known word"
    end
  end

  def dictionary
    handle = File.readlines('/usr/share/dict/words')
    handle.map do |line|
      line.chomp
    end
  end

  def shutdown_response
    @total_requests += 1
    @shutdown = true
    "Total requests #{@total_requests}"
  end
end
