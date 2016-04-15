require './lib/parser'

class Router
  attr_reader :shutdown

  def initialize
    @parser = Parser.new
    @hello_counter = 0
    @total_requests = 0
    @shutdown = false
  end

  def determine_response
    if @parser.get_path == "/"
      root_response
    elsif @parser.get_path == "/hello"
      hello_response
    elsif @parser.get_path == "/datetime"
      date_time_response
    elsif @parser.get_path.include?("/word_search")
      word_search_response
    elsif @parser.get_path == "/shutdown"
      shutdown_response
    else
      puts "#{@parser.get_path} is not a valid path"
    end
  end

  def root_response
    @total_requests += 1
    "Verb: #{@parser.get_verb}\n"\
    "Path: #{@parser.get_path}\n"\
    "Protocol: #{@parser.get_protocol}\n"\
    "Host: #{@parser.get_host}\n"\
    "Port: #{@parser.get_port}\n"\
    "Origin: #{@parser.get_origin}\n"\
    "Accept: #{@parser.get_accept}"
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
