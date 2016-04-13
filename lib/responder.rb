require './lib/server'

class Responder

  def initialize
    @counter = 0
  end

  def give_response(client)
    client.puts headers
    client.puts format_response
  end

  def format_response
    response = "<pre>" + "Hello World  (#{@counter/2})\n" + "</pre>"
    # response = "<pre>" + request_lines.join("\n") + "</pre>"
    output = "<html><head></head><body>#{response}</body></html>"
  end

  def headers
    ["http/1.1 200 ok",
    "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
    "server: ruby",
    "content-type: text/html; charset=iso-8859-1",
    "content-length: #{format_response.length}\r\n\r\n"].join("\r\n")
  end

  def format_first_request_line
    #don't have a way to access request_lines
    hash = {}
    first_line = @request_lines[0].split(" ")
    #find first line the the array, split it
    hash["Verb"] = first_line[0] #GET
    hash["Path"] = first_line[1] # /
    hash["Protocol"] = first_line[2] #HTTP/1.1
    hash
  end
end
