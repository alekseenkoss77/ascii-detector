# frozen_string_literal: true

module AsciiDetector
  module Fields
    class FieldBase
      attr_reader :field

      def initialize(input)
        validate_input!(input)
        @field = input
      end

      def width
        @width ||= field.first.count.to_i
      end

      def height
        @height ||= field.count
      end

      def [](key)
        field[key]
      end

      def to_s
        field.map { |row| row.join('') }.join("\n")
      end

      private

      def validate_input!(input)
        return if input.is_a?(Array) && input.filter { |r| !r.is_a?(Array) }.count.zero?

        raise ArgumentError, 'input must be 2D array'
      end
    end
  end
end
