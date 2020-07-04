require 'spec_helper'

RSpec.describe AsciiDetector::Field do
  let(:field) do
    [
      [0, 0, 1, 0, 0],
      [0, 1, 1, 1, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 0, 0, 0],
    ]
  end

  describe '#each_with_index' do
    subject { described_class.new(field) }

    context 'with block' do
      it 'iterates over all items' do
        subject.each_with_index do |item, row, col|
          expect(item).to eq(field[row][col])
        end
      end
    end

    context 'without block' do
      it 'raises ArgumentError exception' do
        expect { subject.each_with_index }.to raise_error(ArgumentError, 'Block not given')
      end
    end
  end
end
