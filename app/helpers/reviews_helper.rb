module ReviewsHelper
  def rating_progress_bar(label, value)
    percentage = (value.to_f * 10).round # Convert rating to percentage (e.g., 7.5 -> 75%)

    content_tag(:div, class: "mb-2") do
      concat(content_tag(:div, class: "flex justify-between font-medium") do
        concat content_tag(:span, label)
        concat content_tag(:span, value.round(1).to_s)
      end)

      concat(content_tag(:div, class: "w-full bg-gray-200 rounded h-2 mb-2") do
        content_tag(:div, "", class: "bg-green-500 h-2", style: "width: #{percentage}%;")
      end)
    end
  end

  def final_rating_label(final_rating)
    case final_rating.to_f
    when 9..10
      "#{final_rating.to_s} Exceptional"
    when 8...9
      "#{final_rating.to_s} Excellent"
    when 7...8
      "#{final_rating.to_s} Very Good"
    when 6...7
      "#{final_rating.to_s} Good"
    else
      "#{final_rating.to_s} Below Expectation"
    end
  end

  def display_property_review_averages(all_reviews)
    reviews = all_reviews

    # Calculate average for each category
    ratings = {
      "Location" => reviews.average(:location_rating) || 0,
      "Cleanliness" => reviews.average(:cleanliness_rating) || 0,
      "Service" => reviews.average(:service_rating) || 0,
      "Value for Money" => reviews.average(:value_for_money_rating) || 0,
      "Room Comfort Quality" => reviews.average(:room_comfort_quality_rating) || 0,
      "Facilities" => reviews.average(:facilities_rating) || 0
    }

    content_tag(:div) do
      # Generate individual ratings with progress bars
      concat(ratings.map { |label, value| rating_progress_bar(label, value) }.join.html_safe)
    end
  end
end
