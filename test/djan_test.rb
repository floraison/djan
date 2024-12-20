
#
# testing djan
#
# Tue Dec 17 09:35:39 JST 2024

$:.unshift('.') unless $:.include?('.'); require 'test/_test_helpers.rb'


class DjanTest < Minitest::Test

  def test_djan_0

    s = Djan.to_d({ a: 'alpha', c: 'gamma', 1 => 2, d: [ 1, 2, 3 ] })
    #puts s

    assert_equal(
      "\e[90m{\e[0;0m \e[33ma\e[0;0m\e[90m:\e[0;0m \e[33malpha\e[0;0m\e[90m,\e[0;0m \e[33mc\e[0;0m\e[90m:\e[0;0m \e[33mgamma\e[0;0m\e[90m,\e[0;0m \e[33m\"1\"\e[0;0m\e[90m:\e[0;0m \e[94m2\e[0;0m\e[90m,\e[0;0m \e[33md\e[0;0m\e[90m:\e[0;0m \e[90m[\e[0;0m \e[94m1\e[0;0m\e[90m,\e[0;0m \e[94m2\e[0;0m\e[90m,\e[0;0m \e[94m3\e[0;0m \e[90m]\e[0;0m \e[90m}\e[0;0m",
      s)
  end

  {

    [] =>
      "\e[90m[]\e[0;0m",
    [ 1, 2, 3 ] =>
      "\e[90m[\e[0;0m \e[94m1\e[0;0m\e[90m,\e[0;0m \e[94m2\e[0;0m\e[90m,\e[0;0m \e[94m3\e[0;0m \e[90m]\e[0;0m",
    {} =>
      "\e[90m{}\e[0;0m",
    { a: 1 } =>
      "\e[90m{\e[0;0m \e[33ma\e[0;0m\e[90m:\e[0;0m \e[94m1\e[0;0m \e[90m}\e[0;0m",
    { 'a' => 'alpha' } =>
      "\e[90m{\e[0;0m \e[33ma\e[0;0m\e[90m:\e[0;0m \e[33malpha\e[0;0m \e[90m}\e[0;0m",

  }.to_a.each_with_index do |(k, v), i|

    define_method "test_djan_colour_#{i}" do

      s = Djan.to_d(k)
      #p k; puts s; p s

      assert_equal(v, s)
    end
  end

  {

    [] => "[]",
    [ 1, 2, 3 ] => "[ 1, 2, 3 ]",
    {} => "{}",
    { a: 1 } => "{ a: 1 }",
    { 'a' => 'alpha' } => "{ a: alpha }",

  }.to_a.each_with_index do |(k, v), i|

    define_method "test_djan_no_colour_#{i}" do

      s = Djan.to_dnc(k)
      #p k; puts s; p s

      assert_equal(v, s)
    end
  end
end

