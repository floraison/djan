
#
# testing djan
#
# Tue Dec 17 09:34:05 JST 2024

$:.unshift('.') unless $:.include?('.')

Dir['test/**/*_test.rb']
  .filter { |pa| ! pa.match(/\/_test\.rb$/) }
  .each { |pa| require(pa) }

