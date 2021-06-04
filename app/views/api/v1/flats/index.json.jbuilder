json.array! @flats do |flat|
    json.extract! flat, :name, :address, :description
end