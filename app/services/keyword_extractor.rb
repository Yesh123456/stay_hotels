class KeywordExtractor
  KEYWORDS = {
    highlighted_facilities: [
      "free wifi", "wifi", "internet", "wheelchair accessible",
      "elevator", "breakfast", "restaurant", "room service",
      "express check-in", "24-hour front desk", "parking", "airport transfer"
    ]
  }

  def self.extract_highlighted_facilities(facility)
    extracted_keywords = []

    # Combine all category values into a single array
    facility.attributes.each do |category, values|
      next unless values.is_a?(Array) # Skip non-array fields

      values.map(&:downcase).each do |value|
        extracted_keywords << value if KEYWORDS[:highlighted_facilities].include?(value)
      end
    end

    { highlighted_facilities: extracted_keywords.uniq }
  end
end
