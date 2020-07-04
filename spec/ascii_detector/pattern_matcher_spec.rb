require 'spec_helper'

RSpec.describe AsciiDetector::PatternMatcher do
  let(:pattern) do
    AsciiDetector::Pattern.new(
      [
        [0, 0, 1, 0, 0],
        [0, 1, 1, 1, 0],
        [0, 0, 1, 0, 0],
        [0, 0, 0, 0, 0],
      ]
    )
  end

  let(:frame) do
    AsciiDetector::Frame.new(
      [
        [0, 0, 1, 0, 0],
        [0, 1, 1, 1, 0],
        [0, 0, 1, 1, 0],
        [0, 0, 0, 0, 0],
      ]
    )
  end

  subject { described_class.new(frame, pattern) }

  describe '#call' do
    it 'returns percent of matched items' do
      expect(subject.call).to eq(95.0)
    end

    context 'when items are strings' do
      let(:pattern) do
        AsciiDetector::Pattern.new(
          [
            ['o', 'o', '-'],
            ['o', 'o', '-']
          ]
        )
      end
    
      let(:frame) do
        AsciiDetector::Frame.new(
          [
            ['o', 'o', '-'],
            ['o', 'o', '-']
          ]
        )
      end

      it 'returns percent of matched items' do
        expect(subject.call).to eq(100)
      end
    end
  end
end
