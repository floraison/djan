
#
# testing djan
#
# Tue Dec 17 09:35:39 JST 2024


group 'djan' do

  test 'djan 0' do

    s = Djan.to_d({ a: 'alpha', c: 'gamma', 1 => 2, d: [ 1, 2, 3 ] })
    #puts s

    assert(
      "\e[90m{\e[0;0m \e[33ma\e[0;0m\e[90m:\e[0;0m \e[33malpha\e[0;0m\e[90m,\e[0;0m \e[33mc\e[0;0m\e[90m:\e[0;0m \e[33mgamma\e[0;0m\e[90m,\e[0;0m \e[33m\"1\"\e[0;0m\e[90m:\e[0;0m \e[94m2\e[0;0m\e[90m,\e[0;0m \e[33md\e[0;0m\e[90m:\e[0;0m \e[90m[\e[0;0m \e[94m1\e[0;0m\e[90m,\e[0;0m \e[94m2\e[0;0m\e[90m,\e[0;0m \e[94m3\e[0;0m \e[90m]\e[0;0m \e[90m}\e[0;0m",
      s)
  end

  group 'defaults to colour' do

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

    }.to_a.each do |k, v|

      test k.inspect do

        s = Djan.to_d(k)
        #p k; puts s; p s

        assert(v, s)
      end
    end
  end

  group '.to_dnc(x)' do

    {

      [] => "[]",
      [ 1, 2, 3 ] => "[ 1, 2, 3 ]",
      {} => "{}",
      { a: 1 } => "{ a: 1 }",
      { 'a' => 'alpha' } => "{ a: alpha }",

    }.to_a.each do |k, v|

      test k.inspect do

        s = Djan.to_dnc(k)
        #p k; puts s; p s

        assert(v, s)
      end
    end
  end

  group 'option :json' do

    {

      "abcd" => [ 'abcd', "\"abcd\"" ],
      { "a" => 1 } => [ '{ a: 1 }', '{ "a": 1 }' ],
      { "a" => "alpha" } => [ '{ a: alpha }', '{ "a": "alpha" }' ],

    }.each do |k, (v0, v1)|

      test "#{k.inspect} --> #{v1}" do

        assert Djan.to_dnc(k), v0
        assert Djan.to_dnc(k, json: true), v1
      end
    end
  end

  group 'option :quote' do

    {

      "abcd" => [ 'abcd', "\"abcd\"" ],
      { "a" => 1 } => [ '{ a: 1 }', '{ a: 1 }' ],
      { "a" => "alpha" } => [ '{ a: alpha }', '{ a: "alpha" }' ],

    }.each do |k, (v0, v1)|

      test "#{k.inspect} --> #{v1}" do

        assert Djan.to_dnc(k), v0
        assert Djan.to_dnc(k, quote: true), v1
      end
    end
  end

  test 'option :width' do

    a = 2.times.map { |i| "a#{i}" * 10 }

    s = Djan.to_dnc(a, width: 80)

    assert s, "[ a0a0a0a0a0a0a0a0a0a0, a1a1a1a1a1a1a1a1a1a1 ]"

    s = Djan.to_dnc(a, width: 40)

    assert s, "[ a0a0a0a0a0a0a0a0a0a0,\n  a1a1a1a1a1a1a1a1a1a1 ]"
  end

  test 'digit strings' do

    assert Djan.d('0000') => '"0000"'
    assert Djan.d('1111') => '"1111"'
  end
end

