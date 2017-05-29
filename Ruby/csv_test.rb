#!/usr/bin/env ruby

 if ARGV.size != 3
   puts "Must give three arguments \nexample: #{__FILE__} filename keyfield valuefield"
  exit
 end

 file_name = ARGV[0]
 key_field = ARGV[1].to_i
 value_field = ARGV[2].to_i
 max_field_index = [key_field, value_field].max
#
h  = Hash.new(0)# Hash(String, Int32).new(default_value: 0, initial_capacity: 414)
#
 File.open(file_name).each_line do |line|
   a = line.split
   if max_field_index < a.size
     h[a[key_field]] += a[value_field].to_i
   end
   
 end
#
 max_key, max_value = h.max_by { |k, v| v }
 puts "max_key:'#{max_key}', sum: #{max_value}"
