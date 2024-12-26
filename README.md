
# djan

[![tests](https://github.com/floraison/fugit/workflows/test/badge.svg)](https://github.com/floraison/fugit/actions)
[![Gem Version](https://badge.fury.io/rb/djan.svg)](https://badge.fury.io/rb/djan)

Pretty pretting for floraison and flor. A bit loose like JS and YAML.

Meant for readable output, not for input.

```ruby
require 'djan'

Djan.to_dnc("papa tango charly")  # -->
  "\"papa tango charly\""
Djan.to_dnc({:a=>"abc"})  # -->
  "{ a: abc }"
Djan.to_dnc([1, 2, "three"])  # -->
  "[ 1, 2, three ]"
```

## options

```ruby
Djan.to_d(x, width: 40)
  # set max width to 40 chars

Djan.to_d(x, width: :console)
Djan.to_d(x, width: true)
  # use console width

Djan.to_d(x, color: false)
Djan.to_d(x, colour: false)
Djan.to_d(x, colors: false)
Djan.to_d(x, colours: false)
Djan.to_dnc(x)
  # output without colours
```

## LICENSE

MIT, see [LICENSE.txt](LICENSE.txt)

