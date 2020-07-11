# frozen_string_literal: true

module AsciiDetector
  class PatternMatcher
    attr_reader :frame, :pattern

    def initialize(frame, pattern)
      @pattern = pattern
      @frame = frame
      @matched = 0
    end

    def call
      frame.each_with_index { |item, row, col| match(item, pattern[row][col]) }
      matched_percent
    end

    private

    def matched_percent
      (@matched.to_f / frame.area) * 100
    end

    def match(field_item, pattern_item)
      return if field_item != pattern_item

      @matched += 1
    end
  end
end
