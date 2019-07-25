restaurant_1 = Restaurant.create!(name: "Lily’s Cafe" , address: "Awesome St.", city: "Allston", state: "MA", zip: "00000", description: "Coffee and crepes. No cats allowed")
restaurant_2 = Restaurant.create!(name: "Jenah’s Diner" , address: "Pretty Excellent St.", city: "Somerville", state: "MA", zip: "11111", description: "Donuts. Served in the company of 2 friendly dogs.")
restaurant_3 = Restaurant.create!(name: "Amanda’s Bakery" , address: "Terrific Avenue", city: "Cambridge", state: "MA", zip: "22222", description: "Cupcakes that resemble pugs")

review_1 = Review.create!(rating: 5, body: "It’s the most amazing place ever", restaurant_id: 1)
review_2 = Review.create!(rating: 5, body: "Dooooonutss!!!!", restaurant_id: 2)
review_3 = Review.create!(rating: 5, body: "Aww, these are too cute to eat!", restaurant_id: 3)
