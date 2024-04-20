# frozen_string_literal: true

json.status :success
json.data @sources do |source|
  json.(source, :id, :name)
end
