module AsciiDetector
  module Fields
    class Frame < Field
      def self.extract(input, x0:, xn:, y0:, yn:)
        frame = input[y0..yn].map { |row| row[x0..xn] }
        new(frame)
      end
    end
  end
end
