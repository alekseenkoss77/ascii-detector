module AsciiDetector
  module Utils
    def self.to_2d_array(input)
      raise ArgumentError.new('Input must be a String') unless input.is_a?(String)

      input.split.map do |line|
        next if line.match?(/[~]+/)

        line.split('')
      end.compact
    end

    def self.read_from_file(file)
      raise ArgumentError.new("File does not exist #{file}") unless File.exist?(file)

      to_2d_array(File.read(file))
    end
  end
end
