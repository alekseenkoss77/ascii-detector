# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AsciiDetector::Detector do
  let(:pattern) do
    path = File.join(AsciiDetector.root, 'spec', 'fixtures', 'pattern2.txt')
    AsciiDetector::Fields::Pattern.new(AsciiDetector::Utils.read_from_file(path))
  end

  let(:field) do
    path = File.join(AsciiDetector.root, 'spec', 'fixtures', 'data.txt')
    AsciiDetector::Fields::Field.new(AsciiDetector::Utils.read_from_file(path))
  end

  let(:noise) { nil }

  subject { described_class.new(pattern: pattern, field: field, noise: noise) }

  describe '#call' do
    context 'with default noise level' do
      it 'returns hash with detected coordinates' do
        result = subject.call

        expect(result.size).to eq(4)
        expect(result).to eq(
          {
            { x0: 42, y0: 0, xn: 49, yn: 7 } => 87.5,
            { x0: 35, y0: 15, xn: 42, yn: 22 } => 84.375,
            { x0: 16, y0: 28, xn: 23, yn: 35 } => 85.9375,
            { x0: 82, y0: 41, xn: 89, yn: 48 } => 85.9375
          }
        )
      end
    end

    context 'with noise level equals 100%' do
      let(:noise) { 100 }

      it 'returns hash with detected coordinates' do
        result = subject.call

        expect(result.size).to eq(0)
        expect(result).to eq({})
      end
    end
  end
end
