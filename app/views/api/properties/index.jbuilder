json.total_pages @properties.total_pages
json.next_page @properties.next_page 

json.properties do
    json.array! @properties do |property|
        json.id property.id 
        json.title property.title 
        json.city property.city
        json.country property.country
        json.property_type property.property_type
        json.price_per_night property.price_per_night
        json.images property.images.map { |image| }
    end
end