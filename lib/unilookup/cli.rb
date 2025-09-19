require 'unicode/name'
require 'tty-table'

module Unilookup
  class CLI
    def self.start(args)
      # Read from stdin if available (piped input), otherwise use args
      input = if !$stdin.tty?
                $stdin.read.strip
              elsif !args.empty?
                args.join(" ")
              else
                puts "Usage: unilookup <text>"
                puts "   or: echo 'text' | unilookup"
                puts ""
                puts "Examples:"
                puts "  unilookup 'Hello 😀'"
                puts "  echo '🚀 Ruby' | unilookup"
                exit 1
              end

      analyze_characters(input)
    rescue StandardError => e
      puts "Error: #{e.message}"
      exit 1
    end

    private

    def self.analyze_characters(text)
      rows = []

      text.each_char.with_index do |char, index|
        next if char == "\n" || char == "\r"

        codepoint = char.ord
        hex_code = "U+#{codepoint.to_s(16).upcase.rjust(4, '0')}"

        # Get character name
        name = begin
          Unicode::Name.of(char)
        rescue
          "UNKNOWN"
        end

        rows << [
          index + 1,
          char,
          hex_code,
          name || "UNKNOWN"
        ]
      end

      if rows.empty?
        puts "No characters to analyze."
        return
      end

      table = TTY::Table.new(
        header: ['#', 'Char', 'Codepoint', 'Name'],
        rows: rows
      )

      puts table.render(:unicode, padding: [0, 1], alignment: [:right, :center, :left, :left])
    end

  end
end