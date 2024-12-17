
#
# testing djan
#
# Tue Dec 17 09:35:39 JST 2024

$:.unshift('.') unless $:.include?('.'); require 'test/_test_helpers.rb'


class DjanTest < Minitest::Test

  def test_hello

    assert_equal('a', 'b')
  end
end

