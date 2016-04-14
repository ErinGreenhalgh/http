require 'pry'

class Parser
  attr_reader :shutdown


  def parse_response(request_lines)
    @request_lines = request_lines
    @request_hash = convert_lines_to_hash

    # #send this information only to the router
    # #parse_response currently holds all the path information
    # if get_path == "/"
    #   root_response
    # elsif get_path == "/hello"
    #   hello_response
    # elsif get_path == "/datetime"
    #   date_time_response
    # elsif get_path.include?("/word_search")
    #   word_search_response
    # elsif get_path == "/shutdown"
    #   shutdown_response
    # else
    #   puts "'#{get_path}' is not a valid path"
    # end
    # # when "/" then root_response
    # # when "/hello" then hello_response
    # # when "/datetime" then date_time_response
    # # when [/\A\/word_search/] then word_search_response
    # # when "/shutdown" then shutdown_response
    # # else puts "#{get_path} is not a valid path"
    # # end
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

end
