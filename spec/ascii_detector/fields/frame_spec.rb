# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AsciiDetector::Fields::Frame do
  let(:field) do
    [
      [0, 0, 1, 0, 0],
      [0, 1, 1, 1, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 0, 0, 0]
    ]
  end

  describe '.extract' do
    it 'returns part of the field' do
      frame = described_class.extract(field, x0: 0, y0: 0, xn: 1, yn: 1)
      expect(frame).to be_an_instance_of(described_class)
      expect(frame.width).to eq(2)
      expect(frame.height).to eq(2)

      expect(frame.field).to eq([[0, 0], [0, 1]])
    end
  end
end
