require 'date'
start = Date.new(2013,1,1)
isbn_numbers = []
20.times do
  isbn_numbers << sprintf("%03d-%07d-%d-%d",(rand 998)+1, (rand 9999998)+1, (rand 8) +1, (rand 8) +1)
end

puts "Date,ISBN,Amount"
(365/7).times do |week|
  puts "#{start},#{isbn_numbers[rand 20]},#{(rand 500)+1}.#{rand 99}"
  start += 7
end
