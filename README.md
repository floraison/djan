
# djan

[![tests](https://github.com/floraison/fugit/workflows/test/badge.svg)](https://github.com/floraison/fugit/actions)
[![Gem Version](https://badge.fury.io/rb/djan.svg)](https://badge.fury.io/rb/djan)

Pretty pretting for floraison and flor. A bit loose like JS and YAML.

Meant for readable output, not for input.

```ruby
require 'djan'

Djan.to_dnc("papa tango charly")
  # --> "papa tango charly"
Djan.to_dnc({:a=>"abc"})
  # --> { a: abc }
```


## LICENSE

MIT, see [LICENSE.txt](LICENSE.txt)

