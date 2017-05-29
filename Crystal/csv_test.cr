#!/usr/bin/env crystal
require "benchmark"

if ARGV.size != 3
  puts "Must give three arguments \nexample: #{PROGRAM_NAME} filename keyfield valuefield"
  exit
end

file_name = ARGV[0]
key_field = ARGV[1].to_i
value_field = ARGV[2].to_i
max_field_index = Math.max(key_field, value_field)

h = Hash(String, Int32).new(default_value: 0, initial_capacity: 414)

File.open(file_name).each_line do |line|
  a = line.split
  if max_field_index < a.size
    h[a[key_field]] += a[value_field].to_i
  end
end

max_key, max_value = h.max_by { |k, v| v }
puts print "max_key:'#{max_key}', sum: #{max_value}"

# max_field_index = max(args.key_field_index, args.value_field_index)
#   sum_by_key = collections.Counter()
#
#   for line in args.file:
#       fields = line.rstrip('\n').split(delim)
#       if max_field_index < len(fields):
#           sum_by_key[fields[args.key_field_index]] += int(fields[args.value_field_index])
#
#   max_entry = sum_by_key.most_common(1);
#   if len(max_entry) == 0:
#       print 'No entries'
#   else:
#       print 'max_key:', max_entry[0][0], 'sum:', max_entry[0][1]
