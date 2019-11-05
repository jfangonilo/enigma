require_relative './lib/enigma'
require_relative './lib/key'
require_relative './lib/date'

input_file =  ARGV[0]
output_file = ARGV[1]
key =         ARGV[2].to_s
date =        ARGV[3].to_s

message = File.open(input_file)

if key.count("0123456789") != 5
  puts "Invalid key: #{key}. New key generated."
  key = Key.number
end

if date.count("0123456789") != 6
  puts "Invalid date: #{date}. Today's date used."
  date = Date.string
end

enigma = Enigma.new
cipher = enigma.decrypt(message, key, date)[:decryption]

File.write(output_file, cipher)

puts "Created #{output_file} with the key #{enigma.key} and date #{enigma.date}"
