require './lib/server'
require 'pry'

class Responder

  def give_response(client, parsed_response)
    @reply = format_response(parsed_response)
    client.puts headers
    client.puts @reply
  end

  def format_response(parsed_response)
    # @counter += 1 unless @request_lines[0].include?("favicon")
    response = "<pre>" + "#{parsed_response}\n" + "</pre>"
    output = "<html><head></head><body>#{response}</body></html>"
  end

  def headers
    ["http/1.1 200 ok",
    "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
    "server: ruby",
    "content-type: text/html; charset=iso-8859-1",
    "content-length: #{@reply.length}\r\n\r\n"].join("\r\n")
  end

end
