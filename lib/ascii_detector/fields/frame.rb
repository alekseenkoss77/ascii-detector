# frozen_string_literal: true

module AsciiDetector
  module Fields
    class Frame < Field
      # rubocop:disable Naming/MethodParameterName
      def self.extract(input, x0:, xn:, y0:, yn:)
        frame = input[y0..yn].map { |row| row[x0..xn] }
        new(frame)
      end
      # rubocop:enable Naming/MethodParameterName
    end
  end
end
