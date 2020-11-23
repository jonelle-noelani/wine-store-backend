# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Wine.destroy_all
User.destroy_all
Review.destroy_all
CartItem.destroy_all

# WINE name type region ‘price:decimal{5, 2}’ description image
avinyo = Wine.create(name: "Avinyo", wine_type: "sparkling", region: "Spain", price: 19, description: "Prickly pear and citrus. Decent minerality with some stone fruit. Tart and crisp green apple with a snap of lemon at the end.", image: "https://www.wine-searcher.com/images/labels/63/73/10086373.jpg?width=133&height=196&fit=bounds&canvas=133,196")

schramsberg = Wine.create(name: "Schramsberg", wine_type: "sparkling", region: "California", price: 34.99,
description: "Gold color, lots of fine bubbles. Brioche on nose. Medium body, dry. Almonds, pears, apples on palate.",
image: "https://www.wine-searcher.com/images/labels/13/93/10261393.jpg?width=133&height=196&fit=bounds&canvas=133,196")

arras = Wine.create(name: "House of Arras", wine_type: "sparkling", region: "Australia", price: 46.00,
description: "Lovely struck match adds complexity to a little toffee.  Orchard fruits with delicious juiciness and length.",
image: "https://www.wine-searcher.com/images/labels/30/33/10623033.jpg?width=133&height=196&fit=bounds&canvas=133,196")

henriot = Wine.create(name: "Henriot", wine_type: "sparkling", region: "France", price: 29.99,
description: "Scents of warm baking spices on the minuscule bubbles with peach, apples and honeydew melon coupled with lemon zest, vanilla and light caramel.",
image: "https://www.wine-searcher.com/images/labels/15/06/10391506.jpg?width=182&height=196&fit=bounds&canvas=182,196")

leeuwin = Wine.create(name: "Leeuwin", wine_type: "white", region: "Australia", price: 11.00,
description: "Lovely delicate perfume here, gentle creamy and almond oak influence, a touch of mint.",
image: "https://www.wine-searcher.com/images/labels/72/01/11087201.jpg?width=133&height=196&fit=bounds&canvas=133,196")

goldeneye = Wine.create(name: "Goldeneye", wine_type: "red", region: "California", price: 47.99, 
description: "Mild tannins with raspberry and cherry flavors. Crisp and clean finish.",
image: "https://www.wine-searcher.com/images/labels/36/45/10653645.jpg?width=133&height=196&fit=bounds&canvas=133,196")

sea = Wine.create(name: "Sea Smoke", wine_type: "red", region: "California", price: 106.00,
description: "Green leaves with a touch of oak.  White pepper and smoke dance with strawberry.  Long finish.",
image: "https://www.wine-searcher.com/images/labels/76/24/11147624.jpg?width=133&height=196&fit=bounds&canvas=133,196")

drouhin = Wine.create(name: "Domaine Drouhin", wine_type: "red", region: "Oregon", price: 44.00,
description: "Cherries, strawberries, earth, hint of spice on the nose. Light tannins; smooth; strawberry, light tobacco on the palate.",
image: "https://www.wine-searcher.com/images/labels/12/79/10661279.jpg?width=133&height=196&fit=bounds&canvas=133,196")

# USER name dob email password line city state postal_code:integer
user1 = User.create(name: "test", dob: "01/01/1900", email: "test@test.com", password: "test123", line: "123 Test St.", city: "Seattle", state: "WA", postal_code: 98101)

# REVIEW review wine:references user:references
r1 = Review.create(content: "I LOVE BUBBLES!", wine_id: avinyo.id, user_id: user1.id)
r2 = Review.create(content: "More bubbles!", wine_id: schramsberg.id, user_id: user1.id)

# CART_ITEM wine:references user:reference
c1 = CartItem.create(wine_id: avinyo.id, user_id: user1.id)
