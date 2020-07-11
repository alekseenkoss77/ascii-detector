# frozen_string_literal: true

module AsciiDetector
  module Fields
    class Field < FieldBase
      def each_with_index
        raise ArgumentError, 'Block not given' unless block_given?

        row = col = 0

        while row < height
          while col < width
            yield(field[row][col], row, col)
            col += 1
          end
          col = 0
          row += 1
        end
      end

      def area
        @area ||= width * height
      end
    end
  end
end
