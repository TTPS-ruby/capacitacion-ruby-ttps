require_relative 'words_from_string'
require_relative 'count_frequency'

def sorted_count_frequency(word_list)
  count_frequency(word_list).sort_by { |key, count| count }
end

abort 'Must specify a text file to read from' if ARGV.length == 0

raw_text = File.read ARGV.first
word_list = words_from_string raw_text
counts = count_frequency word_list
sorted = sorted_count_frequency word_list
top_five = sorted.last 5

for i in 0...5
  word = top_five[i][0]
  count = top_five[i][1]
  puts "#{word}: #{count}"
end


