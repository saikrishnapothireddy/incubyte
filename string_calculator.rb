class StringCalculator
    def self.add(numbers)
        # returns zero if input is empty
        return 0 if numbers.empty?
        # scans to capture whole number from given input
        numbers = numbers.scan(/-?\d+/).map(&:to_i)
        # checking for negative elements if present
        negatives = numbers.select { |num| num.negative? }
        if negatives.any?
            return "Negative numbers not allowed: #{negatives.join(', ')}"
        end
        # returns final sum
        return numbers.sum
    end
end