![Build Status](https://github.com/SamualLB/libtermbox/actions/workflows/test.yml/badge.svg)

# lib_termbox

Binding for the [termbox](https://github.com/nsf/termbox) library

## Installation

1. Add to the `shard.yml`:

```yaml
dependencies:
  lib_termbox:
    github: SamualLB/lib_termbox
```

2. Run `shards install`

**NOTE**: This requires the termbox library!

## Usage

```
require "lib_termbox"
```

These a raw bindings, it is probably worth having some sort of interface between such as in the [TUI](https://github.com/SamualLB/tui) backend.

A quick demo:

```
crystal run examples/init.cr
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/SamualLB/libtermbox/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Samual Black](https://github.com/SamualLB) - creator and maintainer
