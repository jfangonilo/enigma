require_relative 'enigma'
require_relative 'key'
require_relative 'date'

input_file = ARGV[0]
message = File.open(input_file)

enigma = Enigma.new
key = Key.number
date = Date.string
cipher = enigma.decrypt(message, key, date)[:decryption]

output_file = ARGV[1]
File.write(output_file, cipher)

puts "Created #{output_file} with the key #{key} and date #{date}"
