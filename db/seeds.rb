# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"
require "json"

recipe_title = [
  "Mushroom Risotto",
  "Spinach Artichoke Dip",
  "Sweet Potato Gnocchi",
  "Mac & Cheese",
  "Best Bolognese Sauce Ever",
  "Bake Chicken Caprese",
  "Enchalada Lost in the Sauce",
  "Avocado Mousse",
  "Butternut Squash & Arugula Galette",
  "Herb Crusted Rack of Lamb",
  "Spiced Sweet Potato Spirals with Guac",
  "Caitlin's Famous Foccacia"
]

mushroom_risotto_ingredients = [
  {name: "olive oil", quantity: "4", unit: "tbsp"},
  {name: "white mushrooms", quantity: "2", unit: "680 grams"},
  {name: "arborio rice", quantity: "1.5", unit: "cups"},
  {name: "shallots", quantity: "2"},
  {name: "dry white wine", quantity: "1/2", unit: "cup"},
  {name: "chicken broth", quantity: "5", unit: "cups"},
  {name: "parmesan", quantity: "1/3", unit: "cup"},
  {name: "chives", quantity: "4", unit: "tbsp"},
  {name: "butter", quantity: "4", unit: "tbsp"},
  {name: "ground pepper", quantity: "-", unit: "to taste"}
]

spinach_artichoke_ingredients = [
  {name: "regular cream cheese", quantity: "1 package", unit: "227 grams"},
  {name: "sour cream", quantity: "2/3", unit: "cup"},
  {name: "mayonnaise", quantity: "1/3", unit: "cup"},
  {name: "garlic", quantity: "4", unit: "cloves"},
  {name: "jar of artichokes", quantity: "1", unit: "420 grams"},
  {name: "chicken broth", quantity: "5", unit: "cups"},
  {name: "parmesan", quantity: "1/3", unit: "cup"},
  {name: "chives", quantity: "4", unit: "tbsp"},
  {name: "butter", quantity: "4", unit: "tbsp"},
  {name: "frozen chopped spinach package", quantity: "1", unit: "300 grams"},
  {name: "mozzarella", quantity: "1", unit: "cup"},
  {name: "parmesan", quantity: "1/3", unit: "cup"},
  {name: "Bagetter", quantity: "1"}
]

sweet_potato_gnocchi_ingredients = [
  {name: "sweet potatoes", quantity: "3", unit: "large"},
  {name: "ricotta cheese", quantity: "1", unit: "12 ounces"},
  {name: "parmesan", quantity: "1", unit: "cup, grated"},
  {name: "brown sugar", quantity: "2", unit: "tbsp"},
  {name: "salt", quantity: "2 tsp + 2", unit: "tbsp, divided"},
  {name: "nutmeg", quantity: "1/2", unit: "tsp"},
  {name: "flour", quantity: "2 1/2-3/4", unit: "cups"},
  {name: "unsalted butter", quantity: "1", unit: "cup (2 sticks)"},
  {name: "fresh sage", quantity: "6", unit: "tbsp, chopped"},
  {name: "sage leaves", quantity: "a couple", unit: "for garnish"}
]

mac_and_cheese_ingredients = [
  {name: "elbow macaroni (or other tube-shaped pasta)", quantity: "16", unit: "oz"},
  {name: "olive oil", quantity: "1", unit: "tbsp"},
  {name: "butter/margarine", quantity: "6", unit: "tbsp"},
  {name: "flour", quantity: "1/3", unit: "cup"},
  {name: "milk (dairy or alternative)", quantity: "3", unit: "cups"},
  {name: "heavy whipping cream (>30%)", quantity: "1", unit: "cup"},
  {name: "cheddar cheese, shredded", quantity: "4", unit: "cups"},
  {name: "gruyere cheese, shredded", quantity: "2", unit: "cups"},
  {name: "panko crumbs", quantity: "1.5", unit: "cups"},
  {name: "butter, melted", quantity: "4", unit: "tbsp"},
  {name: "parmesan", quantity: "1/2", unit: "cup"},
  {name: "paprika", quantity: "1/4", unit: "tsp"},
  {name: "salt and pepper", quantity: "to taste"}
]

bolognese_ingredients = [
  {name: "olive oil", quantity: "2", unit: "tbsp"},
  {name: "butter", quantity: "6", unit: "tbsp"},
  {name: "white onion, diced", quantity: "1", unit: "large (or 2 small)"},
  {name: "garlic, minced", quantity: "5-6", unit: "cloves"},
  {name: "celery, diced", quantity: "~4", unit: "stalks (1 cup)"},
  {name: "carrots, diced", quantity: "~2-3", unit: "carrots (1 cup)"},
  {name: "ground beef", quantity: "1", unit: "lb (or 0.5 lb beef & 0.5 lb veal)"},
  {name: "ground pork", quantity: "0.5", unit: "lb"},
  {name: "milk (1%)", quantity: "2", unit: "cups"},
  {name: "dry white wine", quantity: "2", unit: "cups"},
  {name: "Italian San Marzano whole tomatoes, crushed", quantity: "3", unit: "cups with juice"},
  {name: "nutmeg", quantity: "1/4", unit: "tsp"},
  {name: "salt and pepper", quantity: "to taste"},
  {name: "parmesan", quantity: "for topping"},
  {name: "pasta of choice", quantity: "as desired"}
]

caprese_chicken_ingredients = [
  {name: "chicken breasts (boneless & skinless)", quantity: "4", unit: "pieces"},
  {name: "olive oil", quantity: "as needed", unit: "preferably extra virgin"},
  {name: "tomatoes, sliced", quantity: "2", unit: "medium"},
  {name: "fresh basil", quantity: "to taste"},
  {name: "fresh mozzarella, sliced", quantity: "4", unit: "slices"},
  {name: "salt and pepper", quantity: "to taste"},
  {name: "dried basil", quantity: "1", unit: "tsp"},
  {name: "dried oregano", quantity: "1", unit: "tsp"},
  {name: "garlic powder", quantity: "1", unit: "tsp"},
  {name: "red onion, diced", quantity: "1/2", unit: "medium"},
  {name: "balsamic vinegar", quantity: "4", unit: "tbsp"},
  {name: "balsamic glaze", quantity: "as needed", unit: "(store-bought or homemade)"}
]

enchilada_sauce_ingredients = [
  {name: "olive oil", quantity: "2", unit: "tbsp"},
  {name: "flour", quantity: "2", unit: "tbsp"},
  {name: "chili powder", quantity: "4", unit: "tbsp"},
  {name: "garlic powder", quantity: "1", unit: "tsp"},
  {name: "salt", quantity: "1/2", unit: "tsp"},
  {name: "cumin", quantity: "1/4", unit: "tsp"},
  {name: "dried oregano", quantity: "1/4", unit: "tsp"},
  {name: "chicken or veggie broth", quantity: "2", unit: "cups"}
]

avocado_sauce_ingredients = [
  {name: "raw cashews, soaked and drained", quantity: "1/2", unit: "cup"},
  {name: "ripe avocados", quantity: "2", unit: "small"},
  {name: "lime juice", quantity: "3", unit: "tbsp"},
  {name: "water", quantity: "~1/2", unit: "cup"},
  {name: "chopped cilantro (optional)", quantity: "1/2", unit: "cup"}
]

butternut_squash_galette_ingredients = [
  {name: "butternut squash, peeled and cubed", quantity: "1", unit: "lb (~1/2 large squash)"},
  {name: "olive oil", quantity: "3 + 2 + extra", unit: "tbsp"},
  {name: "salt and pepper", quantity: "to taste"},
  {name: "onions, thinly sliced", quantity: "2", unit: "medium"},
  {name: "fresh sage leaves, finely chopped", quantity: "6", unit: "leaves"},
  {name: "goat cheese, sliced into 1/2 cm rounds", quantity: "2/3", unit: "cup (150g)"},
  {name: "large egg, lightly beaten", quantity: "1", unit: "for egg wash"},
  {name: "baby arugula", quantity: "1", unit: "cup"},
  {name: "pine nuts", quantity: "4", unit: "tbsp"},
  {name: "puff pastry, defrosted", quantity: "1", unit: "sheet"}
]

rack_of_lamb_ingredients = [
  {name: "racks of lamb", quantity: "2", unit: "racks (~1/2 rack per person)"},
  {name: "olive oil", quantity: "2 + splash", unit: "tbsp"},
  {name: "garlic, minced", quantity: "6", unit: "cloves"},
  {name: "salt and pepper", quantity: "to taste"},
  {name: "fresh parsley", quantity: "2", unit: "sprigs"},
  {name: "fresh thyme", quantity: "1", unit: "sprig"},
  {name: "fresh rosemary", quantity: "1", unit: "sprig"},
  {name: "fresh cilantro (optional)", quantity: "1", unit: "sprig"}
]

spiralized_sweet_potato_ingredients = [
  {name: "sweet potatoes, spiraled", quantity: "2", unit: "medium"},
  {name: "hot water with salt", quantity: "1", unit: "tsp"},
  {name: "olive oil", quantity: "2", unit: "tbsp"},
  {name: "salt", quantity: "1", unit: "tsp"},
  {name: "garlic powder", quantity: "1", unit: "tsp"},
  {name: "chili powder (Mexican preferred)", quantity: "1/2", unit: "tsp"},
  {name: "cumin", quantity: "1/2", unit: "tsp"},
  {name: "guacamole", quantity: "as desired"},
  {name: "diced green onions", quantity: "for garnish"},
  {name: "lime wedges", quantity: "for garnish"}
]

focaccia_ingredients = [
  {name: "olive oil", quantity: "1/2", unit: "cup"},
  {name: "garlic, minced", quantity: "4", unit: "cloves"},
  {name: "fresh thyme, chopped (or dried)", quantity: "1", unit: "tbsp (1 sprig)"},
  {name: "fresh rosemary, chopped (or dried)", quantity: "1", unit: "tbsp (1 sprig)"},
  {name: "black pepper", quantity: "1", unit: "tsp"},
  {name: "warm water", quantity: "1", unit: "cup"},
  {name: "active dry yeast", quantity: "1", unit: "packet (2 + 1/4 tsp)"},
  {name: "honey", quantity: "1/2", unit: "tsp"},
  {name: "flour", quantity: "2 + 1/2", unit: "cups"},
  {name: "salt", quantity: "1", unit: "tsp"}
]

mushroom_risotto_instructions = [
  { order: "1", text: "In a big & deep pot, heat 2 tbsp of olive oil over medium-high heat.", media_url: "" },
  { order: "2", text: "Add the onions and cook for about 5 minutes until soft and translucent.", media_url: "" },
  { order: "3", text: "Add garlic and cook for 1 minute.", media_url: "" },
  { order: "4", text: "Add the mushrooms and cook for 5 minutes until they soften and start releasing their juices.", media_url: "" },
  { order: "5", text: "Add the rice and cook, stirring occasionally, for about 2 minutes until the rice turns slightly translucent at the edges.", media_url: "" },
  { order: "6", text: "Pour in the white wine and cook until the liquid has mostly evaporated.", media_url: "" },
  { order: "7", text: "Add the broth 1/2 cup at a time, stirring frequently, and let the rice absorb it before adding more broth. Continue until the rice is al dente and creamy.", media_url: "" },
  { order: "8", text: "Stir in the Parmesan cheese and season with salt and pepper to taste.", media_url: "" },
  { order: "9", text: "Serve immediately, garnished with extra Parmesan and parsley if desired.", media_url: "" }
]

spinach_artichoke_dip_instructions = [
  { order: "1", text: "Preheat oven to 375°F.", media_url: "" },
  { order: "2", text: "Combine softened cream cheese, sour cream/Greek yogurt, mayo/pesto, garlic, chopped artichoke hearts (with oil left in jar), Parmesan, spinach, and 1 cup of mozzarella in a large bowl.", media_url: "" },
  { order: "3", text: "Spray or oil a small, oven-safe cooking dish.", media_url: "" },
  { order: "4", text: "Pour mixture into the dish.", media_url: "" },
  { order: "5", text: "Spread 1/2 cup of mozzarella over the top of the mixture.", media_url: "" },
  { order: "6", text: "Bake, uncovered, for 25-30 minutes.", media_url: "" },
  { order: "7", text: "BE CAREFUL, it will be very hot!", media_url: "" },
  { order: "8", text: "Serve with chips or a baguette to dip.", media_url: "" }
]

sweet_potato_gnocchi_instructions = [
  { order: "1", text: "Place ricotta in a fine mesh sieve or colander with paper towels on the bottom for about 1 hour to drain the liquid (DO NOT SKIP THIS OR ELSE YOUR DOUGH WILL SUCK).", media_url: "" },
  { order: "2", text: "To cook sweet potatoes, bake them at 425°F for 30-40 minutes wrapped in tin foil (cook until soft to the touch with oven mitts on, OBVS) OR pierce potatoes all over with a fork (don’t stab yourself, speaking from experience) and microwave 5 minutes at a time until soft.", media_url: "" },
  { order: "3", text: "Cut sweet potatoes in half and let them cool.", media_url: "" },
  { order: "4", text: "Scrape the sweet potato flesh out of the skin into a bowl, mash it up, and measure 3 cups into a large bowl.", media_url: "" },
  { order: "5", text: "Add drained ricotta to the sweet potatoes and mix well.", media_url: "" },
  { order: "6", text: "Add 1 cup of Parmesan, brown sugar, 2 tsp salt, and 1/2 tsp nutmeg and mix well.", media_url: "" },
  { order: "7", text: "Add flour to the mixture, 1/2 cup at a time, until a soft dough forms (you will only use about 2 cups of flour).", media_url: "" },
  { order: "8", text: "Flour your counter/table (clean it first) and roll out the dough. Use those wrists and knead it HARD. You may need to add more flour to the surface to prevent sticking.", media_url: "" },
  { order: "9", text: "Once the dough is formed (not too sticky), cut it into 6 equal-ish pieces.", media_url: "" },
  { order: "10", text: "Start with one piece and roll it into a long rope about 1 inch thick.", media_url: "" },
  { order: "11", text: "Cut the rope into about 20 pieces (or cut about every 1 inch).", media_url: "" },
  { order: "12", text: "Repeat step 11 with the other 5 pieces.", media_url: "" },
  { order: "13", text: "Roll each little gnocchi on the back of a fork (or, if you're a pro and have a gnocchi board, use that).", media_url: "" },
  { order: "14", text: "Bring a big pot of water with 1 tbsp salt to a boil.", media_url: "" },
  { order: "15", text: "In batches (all the gnocchi will NOT fit at once), boil until tender and they float to the surface (about 4-5 minutes).", media_url: "" },
  { order: "16", text: "Cool the gnocchi COMPLETELY (VERY IMPORTANT).", media_url: "" },
  { order: "17", text: "In a large skillet, melt 1 cup of unsalted butter until it turns slightly brown, swirling the pan occasionally (DON’T STIR).", media_url: "" },
  { order: "18", text: "Add chopped sage and turn off the heat. Season with lots of salt and pepper.", media_url: "" },
  { order: "19", text: "Pour about 1/2 of the sage butter into a separate bowl.", media_url: "" },
  { order: "20", text: "Add the gnocchi to the skillet with the remaining sage butter and cook for about 4 minutes.", media_url: "" },
  { order: "21", text: "Repeat with the rest of the butter and gnocchi in batches.", media_url: "" },
  { order: "22", text: "Add sage leaves to make it pretty if you want (not necessary but great if you want to post it to the gram).", media_url: "" }
]

mac_and_cheese_instructions = [
  { order: "1", text: "Heat the oven to 350°F.", media_url: "" },
  { order: "2", text: "Spray a large baking dish with cooking spray or grease with oil.", media_url: "" },
  { order: "3", text: "Shred your cheeses (cheddar & gruyere/mozza ONLY) and combine them in a bowl.", media_url: "" },
  { order: "4", text: "Heat a big pot over high heat with about 2 tsp of salt until boiling. Add pasta and cook until it's done but still firm (a little less than al dente, as it will cook more in the oven).", media_url: "" },
  { order: "5", text: "Place the pasta in a large bowl and drizzle with olive oil to prevent sticking.", media_url: "" },
  { order: "6", text: "In a big pan, melt 6 tbsp of butter or margarine.", media_url: "" },
  { order: "7", text: "Whisk in 1/3 cup of flour (WHISK CONSTANTLY, DO NOT LET IT BURN) for about 1 minute until it's golden and bubbly.", media_url: "" },
  { order: "8", text: "Slowly add in milk and heavy cream WHILE WHISKING until smooth (NO CLUMPS!).", media_url: "" },
  { order: "9", text: "Whisk until bubbles appear on the surface, then continue whisking for about 2 more minutes.", media_url: "" },
  { order: "10", text: "Add salt and pepper, and keep whisking!", media_url: "" },
  { order: "11", text: "Add 2 cups of the shredded cheese mix from step 3, whisk until smooth. Repeat with the remaining 2 cups of cheese. The sauce should be thick now.", media_url: "" },
  { order: "12", text: "Stir in the pasta until it's well mixed with the sauce.", media_url: "" },
  { order: "13", text: "Pour half of the mac and cheese into the prepared baking dish from step 2.", media_url: "" },
  { order: "14", text: "Sprinkle the remaining 2 cups of cheese mix over the mac and cheese, then pour the other half of the mac and cheese over it.", media_url: "" },
  { order: "15", text: "In a small bowl, mix panko crumbs, Parmesan, paprika, and 4 tbsp of melted butter. It will be clumpy and coarse.", media_url: "" },
  { order: "16", text: "Sprinkle the panko mixture over the top of the mac and cheese.", media_url: "" },
  { order: "17", text: "Put the dish in the oven and cook for about 30 minutes, until the top is bubbly, brown, and delicious.", media_url: "" }
]

bolognese_instructions = [
  { order: "1", text: "PREP ALL YOUR DICING: Dice onions, celery, carrots, and mince the garlic. Also, pour the canned Italian San Marzano tomatoes into a big bowl and crush them with your hands. (It will burn if you try to do this while cooking.)", media_url: "" },
  { order: "2", text: "Heat 2 tbsp olive oil and 6 tbsp butter over medium heat in a HUGE, deep pot until the butter is melted and stops foaming.", media_url: "" },
  { order: "3", text: "Add the diced onion and cook for about 4 minutes until soft and translucent.", media_url: "" },
  { order: "4", text: "Add the garlic and stir for 1 minute until fragrant.", media_url: "" },
  { order: "5", text: "Add the diced celery and carrot, stir everything together well, and cook for about 3 minutes until softened a bit.", media_url: "" },
  { order: "6", text: "Add all your ground meat, and season with 2-3 tsp of salt and a good amount of pepper to taste.", media_url: "" },
  { order: "7", text: "Crumble the meat with a spoon and continue stirring/cooking until the meat is no longer red.", media_url: "" },
  { order: "8", text: "Reduce heat to low, add 2 cups of milk, and stir well. Simmer until small bubbles of milk are poking through, about 1 hour, stirring every 10-15 minutes to prevent sticking.", media_url: "" },
  { order: "9", text: "Once the milk has evaporated, add 1/4 tsp nutmeg and 2 cups dry white wine. Continue simmering while stirring every 10-15 minutes for about 1 more hour.", media_url: "" },
  { order: "10", text: "Once the wine has evaporated, measure 3 cups of the crushed tomatoes from step 1 and add them to the pan. Stir, and when the tomatoes are bubbling, turn the heat down slightly so a small bubble breaks through the surface.", media_url: "" },
  { order: "11", text: "Continue simmering for at least 2 more hours, stirring every 20 minutes. If it starts to dry out, add 1/2 cup of water and stir well. Make sure all the water is absorbed before it's done.", media_url: "" },
  { order: "12", text: "While the sauce simmers, cook your pasta.", media_url: "" },
  { order: "13", text: "Season the sauce well with salt and pepper, and remove from heat.", media_url: "" },
  { order: "14", text: "Add some sauce to the cooked pasta, along with some butter, and stir well. Serve with fresh Parmesan and a glass of wine.", media_url: "" }
]

caprese_chicken_instructions = [
  { order: "1", text: "Preheat the oven to 425°C.", media_url: "" },
  { order: "2", text: "Place chicken breasts in a baking dish (I personally use a cast-iron skillet I bought on Amazon).", media_url: "" },
  { order: "3", text: "Combine dried basil, dried oregano, garlic powder, salt, and pepper (~1 tsp of each) in a small bowl.", media_url: "" },
  { order: "4", text: "Rub 2-3 tbsp of olive oil on the chicken breasts evenly and sprinkle with the seasoning mix from step 3.", media_url: "" },
  { order: "5", text: "Spread red onions and tomato slices around the chicken, ensuring at least one slice is on top of each breast.", media_url: "" },
  { order: "6", text: "Pour balsamic vinegar over the chicken breasts.", media_url: "" },
  { order: "7", text: "Stick that dish in the oven, ask Siri to set a timer for 20 minutes, and pour yourself a glass of wine.", media_url: "" },
  { order: "8", text: "If you're making your own balsamic glaze, do it now (recipe below).", media_url: "" },
  { order: "9", text: "Take the chicken out of the oven and set the oven to broil on HIGH.", media_url: "" },
  { order: "10", text: "Make a small cut in the center of the thickest chicken breast to check for no pink, or use a meat thermometer (if you have one) to ensure the temperature is at least 165°F.", media_url: "" },
  { order: "11", text: "Place 1 slice of fresh mozzarella and 1 fresh basil leaf on each chicken breast.", media_url: "" },
  { order: "12", text: "Stick the chicken back in the oven and broil for about 5 minutes, or until the cheese is melty and has a few golden spots.", media_url: "" },
  { order: "13", text: "Drizzle balsamic glaze all over the chicken.", media_url: "" }
]

enchilada_sauce_instructions = [
  { order: "1", text: "Combine all of the seasonings (NOT FLOUR, NOT BROTH) in a bowl. This will make it much easier as you need to be quick on your feet.", media_url: "" },
  { order: "2", text: "Heat oil in a small pot over medium-high heat.", media_url: "" },
  { order: "3", text: "Stir in the flour and whisk for 1 minute until it thickens and turns a little brown (DO NOT BURN).", media_url: "" },
  { order: "4", text: "Add all of the seasonings to the pot.", media_url: "" },
  { order: "5", text: "SLOWLY add the broth while whisking to remove all lumps.", media_url: "" },
  { order: "6", text: "Lower heat to the lowest or second-lowest setting and simmer for about 10-15 minutes until it gets thick.", media_url: "" },
  { order: "7", text: "Use the sauce in your enchiladas, refrigerate for up to 3 days, or freeze for up to 3 months in an airtight container.", media_url: "" }
]

avocado_sauce_instructions = [
  { order: "1", text: "Blend all ingredients in a blender on the highest setting until smooth and creamy.", media_url: "" },
  { order: "2", text: "Add more water as needed to achieve the desired consistency.", media_url: "" }
]

butternut_squash_galette_instructions = [
  { order: "1", text: "Preheat the oven to 425°F.", media_url: "" },
  { order: "2", text: "Put cubed butternut squash into a bowl or large Ziploc bag and toss with 3 tbsp olive oil, salt, and pepper.", media_url: "" },
  { order: "3", text: "Spread squash onto a baking sheet lined with aluminum foil or parchment paper in a SINGLE LAYER (very important for even cooking).", media_url: "" },
  { order: "4", text: "Bake for about 20 minutes until you can easily pierce the squash with a fork and it is slightly browned.", media_url: "" },
  { order: "5", text: "Set squash aside to cool.", media_url: "" },
  { order: "6", text: "Turn the oven to 400°F.", media_url: "" },
  { order: "7", text: "Heat 2 tbsp of olive oil in a small skillet over medium heat.", media_url: "" },
  { order: "8", text: "Add sliced onions and cook for about 5 minutes until they are soft.", media_url: "" },
  { order: "9", text: "Add chopped sage, stir for 1 minute, and remove from heat.", media_url: "" },
  { order: "10", text: "Roll out puff pastry until it's thin, but not so thin that it tears (~30 cm diameter or less).", media_url: "" },
  { order: "11", text: "Place the pastry on a baking sheet lined with foil or parchment paper.", media_url: "" },
  { order: "12", text: "Spread onions on the pastry, leaving about 3-5 cm from the edges.", media_url: "" },
  { order: "13", text: "Place the squash over the onions in a single layer.", media_url: "" },
  { order: "14", text: "Tuck small pieces of goat cheese in between, over, and under the squash.", media_url: "" },
  { order: "15", text: "Fold the edges of the pastry up, crimp a little with your fingers, then brush the edges with egg wash.", media_url: "" },
  { order: "16", text: "Bake for about 30 minutes until the cheese is melted and the tart looks golden.", media_url: "" },
  { order: "17", text: "Let cool for at least 10 minutes, then top with arugula, pine nuts, and drizzle with olive oil like you're Salt Bae.", media_url: "" }
]

rack_of_lamb_instructions = [
  { order: "1", text: "Pat the rack of lamb dry and season generously with salt and pepper.", media_url: "" },
  { order: "2", text: "Heat 2 tbsp of olive oil in a large skillet until it's sizzling.", media_url: "" },
  { order: "3", text: "Place racks in the skillet and brown for 2-3 minutes per side, or until browned (you may need to work in batches, DON'T overcrowd).", media_url: "" },
  { order: "4", text: "Heat the oven to 350°F.", media_url: "" },
  { order: "5", text: "Now it's time to make your herb coating:", media_url: "" },
  { order: "6", text: "BLENDER METHOD: Place minced garlic cloves, parsley, thyme, rosemary, cilantro, and a splash of olive oil into a blender and pulse until it's green and combined. It should be thick.", media_url: "" },
  { order: "7", text: "OR CHOPPING METHOD: Add garlic, chopped parsley, chopped thyme, chopped rosemary, cilantro, and a splash of olive oil to a bowl and mix until well combined.", media_url: "" },
  { order: "8", text: "Coat the lamb racks with the herb mixture, pressing hard with your fingers to form a thick coating.", media_url: "" },
  { order: "9", text: "Transfer the lamb to an oven-safe pan with foil on the bottom.", media_url: "" },
  { order: "10", text: "Place the lamb in the oven for about 10 minutes, then loosely cover with foil and cook for another 10 minutes, or until a meat thermometer reads 120°F.", media_url: "" },
  { order: "11", text: "Once the lamb is out of the oven, let it rest, covered with foil, for 10 minutes (VERY IMPORTANT to keep it juicy!).", media_url: "" },
  { order: "12", text: "Slice the rack between the bones and enjoy!", media_url: "" }
]

spiralized_sweet_potato_fries_instructions = [
  { order: "1", text: "Preheat the oven to 420°F.", media_url: "" },
  { order: "2", text: "Place spiralized sweet potatoes in a large bowl and cover with hot water and 1 tsp of salt. Soak for 15 minutes. Remove and pat dry.", media_url: "" },
  { order: "3", text: "Arrange the sweet potato spirals in a single layer on a baking sheet lined with foil.", media_url: "" },
  { order: "4", text: "Toss spirals with 2 tbsp olive oil, 1 tsp salt, 1 tsp garlic powder, 1/2 tsp chili powder, and 1/2 tsp cumin.", media_url: "" },
  { order: "5", text: "Bake until crispy, about 20-35 minutes (depending on how hot your oven is). DO NOT BURN.", media_url: "" },
  { order: "6", text: "Serve with guacamole on top and green onions. Squeeze a little lime on them and add lime wedges for decoration.", media_url: "" }
]

focaccia_instructions = [
  { order: "1", text: "In a small skillet, combine 1/2 cup olive oil, minced garlic, thyme, rosemary, and pepper over the lowest heat setting. Cook for 5-10 minutes until aromatic, but BEFORE the garlic browns. Turn off the heat.", media_url: "" },
  { order: "2", text: "In a large bowl, combine 1 cup warm water, 1/2 tsp honey, and yeast. Let sit for 5 minutes.", media_url: "" },
  { order: "3", text: "Add 1 cup flour and 1/4 cup of the garlic/herb mix from step 1 to the bowl. Stir 3-4 times, then let sit for 5 minutes.", media_url: "" },
  { order: "4", text: "Add the remaining flour (1.5 cups) and 1 tsp salt. Stir a few more times until combined.", media_url: "" },
  { order: "5", text: "Sprinkle flour on the counter/cutting board and knead the dough for about 10 times until smooth.", media_url: "" },
  { order: "6", text: "Spray cooking spray or oil a large bowl and add the dough ball. Turn so all dough is covered in oil. Cover with a warm damp towel and let rise for 1 hour in a warm place (like in the oven with only the oven light on).", media_url: "" },
  { order: "7", text: "Remove the dough from the oven and heat the oven to 420°F.", media_url: "" },
  { order: "8", text: "Spray cooking spray or oil a large baking pan (9x13 preferred).", media_url: "" },
  { order: "9", text: "Spread the dough over the pan and lightly dimple it with your fingers to create little dents for the garlic/herb mix to absorb.", media_url: "" },
  { order: "10", text: "Drizzle the remaining garlic/herb mix over the dough, making sure it gets into the dimples.", media_url: "" },
  { order: "11", text: "Let the dough rise in the pan for 20 minutes on the counter.", media_url: "" },
  { order: "12", text: "Put the pan in the oven and bake for 15-20 minutes until golden brown.", media_url: "" },
  { order: "13", text: "Let the bread stand for 5-10 minutes before cutting.", media_url: "" },
  { order: "14", text: "Can be stored in the fridge (wrapped tightly in plastic) for 2-3 days, or frozen (wrapped SUPER tightly in plastic) for 1 month.", media_url: "" }
]

mushroom_recipe = Recipe.create!(
  title: "Mushroom Risotto",
  description: "A creamy and comforting dish that's perfect for a cozy night in.",
  prep_time: "15 mins",
  cook_time: "45 mins",
  servings: "6",
  ingredients_attributes: mushroom_risotto_ingredients.map do |ingredient|
    {
      name: ingredient[:name],
      quantity: ingredient[:quantity],
      unit: ingredient[:unit]
    }
  end,
  instruction_steps_attributes: mushroom_risotto_instructions.map do |step|
    {
      order: step[:order],
      text: step[:text],
      media_url: step[:media_url]
    }
  end
)

spinach_recipe = Recipe.create!(
  title: "Spanish Artichoke Dip",
  description: "Ok this is SERIOUSLY the BEST spinach artichoke dip EVER. I have researched. I have experimented. This shit is addictive and AMAZING. My friends ask for it every dinner esp Sophie who is obsessed with it. It is super easy and literally the best thing you will ever put in your mouth.",
  prep_time: "10 mins",
  cook_time: "30 mins",
  servings: "8",
  ingredients_attributes: spinach_artichoke_ingredients.map do |ingredient|
    {
      name: ingredient[:name],
      quantity: ingredient[:quantity],
      unit: ingredient[:unit]
    }
  end,
  instruction_steps_attributes: spinach_artichoke_dip_instructions.map do |step|
    {
      order: step[:order],
      text: step[:text],
      media_url: step[:media_url]
    }
  end
)

sweet_potato_recipe = Recipe.create!(
  title: "Sweet Potato Gnocchi",
  description: "Better than regular potato gnocchi.",
  prep_time: "30 mins",
  cook_time: "40 mins",
  servings: "8",
  ingredients_attributes: sweet_potato_gnocchi_ingredients.map do |ingredient|
    {
      name: ingredient[:name],
      quantity: ingredient[:quantity],
      unit: ingredient[:unit]
    }
  end,
  instruction_steps_attributes: sweet_potato_gnocchi_instructions.map do |step|
    {
      order: step[:order],
      text: step[:text],
      media_url: step[:media_url]
    }
  end
)

mac_and_cheese_recipe = Recipe.create!(
  title: "Mac and Cheese",
  description: "This mac n cheese recipe is mouthwatering, cheesey fucking goodness. It is not healthy and is definitely not for the lactose intolerant (unless you OD on some lactaid before).",
  prep_time: "20 mins",
  cook_time: "1 hour baking",
  servings: "10",
  ingredients_attributes: mac_and_cheese_ingredients.map do |ingredient|
    {
      name: ingredient[:name],
      quantity: ingredient[:quantity],
      unit: ingredient[:unit]
    }
  end ,
  instruction_steps_attributes: mac_and_cheese_instructions.map do |step|
    {
      order: step[:order],
      text: step[:text],
      media_url: step[:media_url]
    }
  end
)

bolognese_recipe = Recipe.create!(
  title: "Bolognese",
  description: "It's sweet, flavourful and hearty AF. It takes a while to cook (lots of stirring involved) but it's actually quite easy. I recommend chopping and prepping everything before you start to make it easier on yourself. ALSO YOU MUST BUY ITALIAN SAN MARZANO TOMATOES IT RLY MAKES A HUGE DIFF (they are a bit more expensive than regular but the taste is chefs kiss). Also some stores sell a ground meat mix of veal/beef/pork which makes it easier.",
  prep_time: "30 mins",
  cook_time: "5 hours",
  servings: "12",
  ingredients_attributes: bolognese_ingredients.map do |ingredient|
    {
      name: ingredient[:name],
      quantity: ingredient[:quantity],
      unit: ingredient[:unit]
    }
  end,
  instruction_steps_attributes: bolognese_instructions.map do |step|
    {
      order: step[:order],
      text: step[:text],
      media_url: step[:media_url]
    }
  end
)

caprese_chicken_recipe = Recipe.create!(
  title: "Caprese Chicken",
  description: "Like a salad but make it protein",
  prep_time: "10 mins",
  cook_time: "25 mins",
  servings: "4",
  ingredients_attributes: caprese_chicken_ingredients.map do |ingredient|
    {
      name: ingredient[:name],
      quantity: ingredient[:quantity],
      unit: ingredient[:unit]
    }
  end,
  instruction_steps_attributes: caprese_chicken_instructions.map do |step|
    {
      order: step[:order],
      text: step[:text],
      media_url: step[:media_url]
    }
  end
)

enchilada_sauce_recipe = Recipe.create!(
  title: "Enchilada Sauce",
  description: "Let's get lost in the sauce",
  prep_time: "5 mins",
  cook_time: "15 mins",
  servings: "2 cups",
  ingredients_attributes: enchilada_sauce_ingredients.map do |ingredient|
    {
      name: ingredient[:name],
      quantity: ingredient[:quantity],
      unit: ingredient[:unit]
    }
  end,
  instruction_steps_attributes: enchilada_sauce_instructions.map do |step|
    {
      order: step[:order],
      text: step[:text],
      media_url: step[:media_url]
    }
  end
)

avocado_sauce_recipe = Recipe.create!(
  title: "Avocado Mousse",
  description: "A creamy and refreshing sauce that pairs well with any dish.",
  prep_time: "5 mins",
  cook_time: "5 mins",
  servings: "1 cup",
  ingredients_attributes: avocado_sauce_ingredients.map do |ingredient|
    {
      name: ingredient[:name],
      quantity: ingredient[:quantity],
      unit: ingredient[:unit]
    }
  end,
  instruction_steps_attributes: avocado_sauce_instructions.map do |step|
    {
      order: step[:order],
      text: step[:text],
      media_url: step[:media_url]
    }
  end
)

butternut_squash_galette_recipe = Recipe.create!(
  title: "Butternut Squash Galette",
  description: "A savory and flaky pastry that's perfect for a cozy night in.",
  prep_time: "20 mins",
  cook_time: "1 hour baking",
  servings: "4 people",
  ingredients_attributes: butternut_squash_galette_ingredients.map do |ingredient|
    {
      name: ingredient[:name],
      quantity: ingredient[:quantity],
      unit: ingredient[:unit]
    }
  end,
  instruction_steps_attributes: butternut_squash_galette_instructions.map do |step|
    {
      order: step[:order],
      text: step[:text],
      media_url: step[:media_url]
    }
  end
)

rack_of_lamb_recipe = Recipe.create!(
  title: "Rack of Lamb",
  description: "It is sooo delicious, basically melts in your mouth.",
  prep_time: "20 mins",
  cook_time: "1 hour baking",
  servings: "4 people",
  ingredients_attributes: rack_of_lamb_ingredients.map do |ingredient|
    {
      name: ingredient[:name],
      quantity: ingredient[:quantity],
      unit: ingredient[:unit]
    }
  end,
  instruction_steps_attributes: rack_of_lamb_instructions.map do |step|
    {
      order: step[:order],
      text: step[:text],
      media_url: step[:media_url]
    }
  end
)

spiralized_sweet_potato_fries_recipe = Recipe.create!(
  title: "Spiced Sweet Potato Spirals with Guacamole",
  description: "A healthy and delicious alternative to regular fries.",
  prep_time: "20 mins",
  cook_time: "35 mins",
  servings: "4 people",
  ingredients_attributes: spiralized_sweet_potato_ingredients.map do |ingredient|
    {
      name: ingredient[:name],
      quantity: ingredient[:quantity],
      unit: ingredient[:unit]
    }
  end,
  instruction_steps_attributes: spiralized_sweet_potato_fries_instructions.map do |step|
    {
      order: step[:order],
      text: step[:text],
      media_url: step[:media_url]
    }
  end
)

focaccia_recipe = Recipe.create!(
  title: "Caitlin's Famous Foccacia",
  description: "Great alone, great app, great w charcutes on top (I prefer prosciutto the best). So versatile and easy.",
  prep_time: "1.5 hours ",
  cook_time: "20 mins baking",
  servings: "8 people",
  ingredients_attributes: focaccia_ingredients.map do |ingredient|
    {
      name: ingredient[:name],
      quantity: ingredient[:quantity],
      unit: ingredient[:unit]
    }
  end,
  instruction_steps_attributes: focaccia_instructions.map do |step|
    {
      order: step[:order],
      text: step[:text],
      media_url: step[:media_url]
    }
  end
)
