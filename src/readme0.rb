
require 'djan'

puts "require 'djan'"
puts

[
  'papa tango charly',
  { a: "abc" },
  [ 1, 2, "three" ],
].each do |x|

  puts "Djan.to_dnc(#{x.inspect})  # -->"
  puts "  #{Djan.to_dnc(x).inspect}"
end

