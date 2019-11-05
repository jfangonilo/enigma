require_relative './lib/enigma'
require_relative './lib/key'
require_relative './lib/date'

input_file = ARGV[0]
output_file = ARGV[1]

message = File.open(input_file)
key = Key.number
date = Date.string

enigma = Enigma.new

cipher = enigma.encrypt(message, key, date)[:encryption]

File.write(output_file, cipher)

puts "Created #{output_file} with the key #{key} and date #{date}"
