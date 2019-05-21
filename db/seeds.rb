require 'json'
require 'open-uri'

ingredient = JSON.parse(open('http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)
ingredient["drinks"].each do |element|
  Ingredient.create(name: element["strIngredient1"])
end
