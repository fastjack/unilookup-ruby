# Unilookup

A command line utility to lookup Unicode character information.

## Description

Unilookup analyzes text and displays detailed information about each Unicode character in a formatted table. It shows the character position, the character itself, its Unicode codepoint, and the official Unicode character name.

## Installation

### From Source

```bash
git clone https://github.com/fastjack/unilookup-ruby.git
cd unilookup-ruby
bundle install
```

### As a Gem

```bash
gem build unilookup.gemspec
gem install unilookup-0.1.0.gem
```

## Usage

### Command Line Arguments

```bash
unilookup "Hello World"
ruby bin/unilookup "Hello World"  # when running from source
```

### Piped Input

```bash
echo "Hello World" | unilookup
cat file.txt | unilookup
```

## Output

The utility displays results in a table format with the following columns:

- **#**: Character position in the input text
- **Char**: The actual Unicode character
- **Codepoint**: Unicode code point in U+XXXX format
- **Name**: Official Unicode character name

## Examples

```bash
$ unilookup "Hi"
┌───┬──────┬───────────┬────────────────────────┐
│ # │ Char │ Codepoint │ Name                   │
├───┼──────┼───────────┼────────────────────────┤
│ 1 │  H   │ U+0048    │ LATIN CAPITAL LETTER H │
│ 2 │  i   │ U+0069    │ LATIN SMALL LETTER I   │
└───┴──────┴───────────┴────────────────────────┘
```

```bash
$ echo "A1!" | unilookup
┌───┬──────┬───────────┬────────────────────────┐
│ # │ Char │ Codepoint │ Name                   │
├───┼──────┼───────────┼────────────────────────┤
│ 1 │  A   │ U+0041    │ LATIN CAPITAL LETTER A │
│ 2 │  1   │ U+0031    │ DIGIT ONE              │
│ 3 │  !   │ U+0021    │ EXCLAMATION MARK       │
└───┴──────┴───────────┴────────────────────────┘
```

## Dependencies

- Ruby >= 2.7.0
- unicode-name gem for character name lookup
- tty-table gem for formatted table output

## Development

```bash
# Install dependencies
bundle install

# Run tests
rake spec

# Build gem
rake build

# Run locally
ruby bin/unilookup "test text"
```

## License

GNU General Public License v3.0
