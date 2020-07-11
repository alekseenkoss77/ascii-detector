# AsciiDetector

Brute-force pattern detector for 2D arrays (Strings, Integers).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ascii_detector'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install ascii_detector

## Usage

```
Usage:
  bin/run [options]

Options:
  -d    # Path to file with data field
  -p    # Path to file with pattern
  -n    # Match level (80 by default)
```

## Example

```
bin/run -d spec/fixtures/data.txt -p spec/fixtures/pattern1.txt -n 80
```

## Testing

You can run tests using RSpec:

```
bundle exec rspec
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
