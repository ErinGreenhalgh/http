require 'socket'
tcp_server = TCPServer.new(9292)
#created a new server object with port as a parameter
#port tells the program which place in the network connection to listen for requests
client = tcp_server.accept
#accept is a method in the Server class takes in information

puts "Ready for a request"
request_lines = []
while line = client.gets and !line.chomp.empty?
  #waits for the user to input information until it encounters an empty line
  request_lines << line.chomp
  #shovels the line from the user into the empty array;
end
#returns an array of all the request lines

puts "Got this request:"
puts request_lines.inspect

puts "Sending response."
response = "<pre>" + request_lines.join("\n") + "</pre>"
output = "<html><head></head><body>#{response}</body></html>"
#formats the response into html
headers = ["http/1.1 200 ok",
          "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
          "server: ruby",
          "content-type: text/html; charset=iso-8859-1",
          "content-length: #{output.length}\r\n\r\n"].join("\r\n")
          #output.length = the number 
client.puts headers
client.puts output

puts ["Wrote this response:", headers, output].join("\n")
client.close
#close the server object after it it has given its reponse
puts "\nResponse complete, exiting."

# GET / HTTP/1.1
# Host: 127.0.0.1:9292
# Connection: keep-alive
# Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
# Upgrade-Insecure-Requests: 1
# User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36
# Accept-Encoding: gzip, deflate, sdch
# Accept-Language: en-US,en;q=0.8
