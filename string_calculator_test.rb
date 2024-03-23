require_relative 'string_calculator'
require 'yaml'

RSpec.describe StringCalculator do
  describe '.add' do
    inputs = YAML.load_file("#{File.dirname(__FILE__)}/inputs.yml")['inputs']

    inputs.each do |key, value|
      it "returns the correct sum for input '#{key}'" do
        expect(StringCalculator.add(value)).to eq(expected_sum(key))
      end
    end

    def expected_sum(key)
      case key
      when 'empty_string' then 0
      when 'single_number' then 1
      when 'comma_separated_numbers' then 6
      when 'newline_and_comma_separated_numbers' then 6
      when 'custom_delimiter_semicolon' then 3
      when 'negative_numbers' then "Negative numbers not allowed: -1, -3"
      when 'custom_delimiter_pipe' then 6
      when 'custom_delimiter_percentage' then 6
      end
    end
  end
end
