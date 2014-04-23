require 'rspec'
require_relative '../lib/polynominal'

describe Polynominal do
  context 'when input is an array of more than two numbers' do
    let(:input) { Array.new([2, 1, -5, 0, 6]) }

    describe '#to_s' do
      it 'returns a polynominal string' do
        polynominal = Polynominal.new input
        expect(polynominal.to_s).to eq '2x^4 + x^3 - 5x^2 + 6'
      end
    end
  end

  context 'when input is an array of numbers and letters' do
    let(:input) { Array.new([2, 'a', -5, 0, 'b']) }

    describe '#to_s' do
      it 'returns a polynominal string just using the numeric elements' do
        polynominal = Polynominal.new input
        expect(polynominal.to_s).to eq '2x^2 - 5x'
      end
    end
  end

  context 'when input is an array with less than two elements' do
    let(:input) { Array.new([2]) }

    describe '#initialize' do
      it 'raises an exception' do
        expect(Polynominal.new(input)).to raise_error('Please provide at least two coefficients')
      end
    end
  end
end
