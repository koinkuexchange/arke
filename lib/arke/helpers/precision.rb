# frozen_string_literal: true

module Arke::Helpers
  module Precision
    def apply_precision(value, precision, min_value=nil)
      value = value.round(12).floor(precision)
      value = min_value if !min_value.nil? && (value < min_value)
      value
    end

    def value_precision(value)
      if value.zero?
        n = 0
      elsif value < 1
        n = 1
        while (value *= 10) < 1
          n += 1
        end
      elsif value < 10
        n = 0
      else
        n = -1
        while (value /= 10) > 1
          n -= 1
          pp value
        end
      end
      n
    end
  end
end
