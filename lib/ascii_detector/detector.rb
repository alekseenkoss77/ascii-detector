module AsciiDetector
  class Detector
    DEFAULT_NOISE_LEVEL = 80.freeze

    attr_reader :pattern, :field, :detections, :noise_level

    def initialize(pattern:, field:, noise: nil)
      @pattern = pattern
      @field = field
      @detections = {}

      @noise_level = noise(noise)
    end

    def call
      field.each_with_index do |_item, row, col|
        coords = frame_coords(row, col)
        y, x = [coords[:yn], coords[:xn]]

        if field[y] && field[y][x]
          match(coords)
        end
      end
      detections
    end

    private

    def frame_border_col(column_index)
      column_index + (pattern.width - 1)
    end

    def frame_border_row(row_index)
      row_index + (pattern.height - 1)
    end

    def match(coords)
      frame = Fields::Frame.extract(field, **coords)
      persist(coords, PatternMatcher.new(frame, pattern).call)
    end

    def persist(coords, match_percent)
      return if match_percent < noise_level

      detections[coords] = match_percent
    end

    def frame_coords(row, col)
      { x0: col, y0: row, xn: frame_border_col(col), yn: frame_border_row(row) }
    end

    def noise(noise)
      noise || DEFAULT_NOISE_LEVEL
    end
  end
end
