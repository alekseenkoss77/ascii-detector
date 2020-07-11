require 'spec_helper'

RSpec.describe AsciiDetector::Fields::FieldBase do
  let(:input) do
    [
      [0, 0, 1, 0, 0],
      [0, 1, 1, 1, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 0, 0, 0],
    ]
  end

  subject { described_class.new(input) }

  describe '#new' do
    context 'when argument is 2D Array' do
      it 'returns instance' do
        is_expected.to be_an_instance_of(described_class)
      end
    end

    context 'when argument 1D Array' do
      let(:input) { [1,2,3] }

      it 'raises ArgumentError exception' do
        expect { is_expected }.to raise_error(ArgumentError, 'input must be 2D array')
      end
    end

    context 'when argument has wrong type' do
      let(:input) { 'foo' }

      it 'raises ArgumentError exception' do
        expect { is_expected }.to raise_error(ArgumentError, 'input must be 2D array')
      end
    end
  end

  describe '#height' do
    it 'returns count of rows' do
      expect(subject.height).to eq(input.count)
    end
  end

  describe '#width' do
    it 'returns count of the first subarray' do
      expect(subject.width).to eq(input.first.count)
    end
  end

  describe '#to_s' do
    it 'returns muliline string representation of array' do
      expect(subject.to_s).to eq("00100\n01110\n00100\n00000")
    end
  end
end
