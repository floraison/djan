
require 'djan'

puts "require 'djan'"
puts

[
  'papa tango charly',
  { a: "abc" },
].each do |x|

  puts "Djan.to_dnc(#{x.inspect})"
  puts "  # --> #{Djan.to_dnc(x)}"
end

