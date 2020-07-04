module Utils
  module Helper
    def self.to_2d_array(input)
      raise ArgumentError.new('Input must be a String') unless input.is_a?(String)

      input.split.map {|line| line.split('') }
    end
  end
end
