module HealthResourcesHelper
  def reviews_label_helper
    count = @health_resource.reviews.count
    count_label = count.positive? ? " (" + count.to_s + ")" : ""
    "Reviews" + count_label
  end
end
