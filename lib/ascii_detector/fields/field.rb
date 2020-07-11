module AsciiDetector
  module Fields
    class Field < FieldBase
      def each_with_index
        raise ArgumentError.new('Block not given') unless block_given?

        row = col = 0

        while row < height do
          while col < width do
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
