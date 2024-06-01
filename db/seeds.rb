# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
mercury = Planet.new(name: "Mercury",
galaxy: "Milky Way",
system: "Solar",
body_type: "planet",
description: "Closest to the Sun. Rocky, no atmosphere, extreme temperatures.",
image: "/home/guillaume/code/Guillaume-Ehrhart/planet_rental/app/assets/images/Mercury.jpg",
price_per_night: 15)
mercury.save
venus = Planet.new(name: "Venus",
galaxy: "Milky Way",
system: "Solar",
body_type: "planet",
description: "Thick atmosphere, hot surface, similar size to Earth.",
image: "https://images-assets.nasa.gov/image/PIA00271/PIA00271~medium.jpg",
price_per_night: 15)
venus.save
earth = Planet.new(name: "Earth",
galaxy: "Milky Way",
system: "Solar",
body_type: "planet",
description: "Our home, with oceans, atmosphere, and diverse life.",
image: "https://images-assets.nasa.gov/image/PIA18033/PIA18033~medium.jpg",
price_per_night: 15)
earth.save
mars = Planet.new(name: "Mars",
galaxy: "Milky Way",
system: "Solar",
body_type: "planet",
description: "Red planet, thin atmosphere, potential for past life.",
image: "https://images-assets.nasa.gov/image/PIA04591/PIA04591~orig.jpg",
price_per_night: 15)
mars.save
jupiter = Planet.new(name: "Jupiter",
galaxy: "Milky Way",
system: "Solar",
body_type: "planet",
description: "Largest planet, gas giant, colorful bands, many moons.",
image: "https://images-assets.nasa.gov/image/PIA00343/PIA00343~small.jpg",
price_per_night: 15)
jupiter.save
saturn = Planet.new(name: "Saturn",
galaxy: "Milky Way",
system: "Solar",
body_type: "planet",
description: "Spectacular rings, gas giant, numerous moons.",
image: "https://images-assets.nasa.gov/image/PIA02225/PIA02225~small.jpg",
price_per_night: 15)
saturn.save
uranus = Planet.new(name: "Uranus",
galaxy: "Milky Way",
system: "Solar",
body_type: "planet",
description: "Ice giant, unique sideways rotation, faint rings.",
image: "https://images-assets.nasa.gov/image/PIA00036/PIA00036~small.jpg",
price_per_night: 15)
uranus.save
neptune = Planet.new(name: "Neptune",
galaxy: "Milky Way",
system: "Solar",
body_type: "planet",
description: "Ice giant, deep blue color, strong winds, Triton moon.",
image: "https://images-assets.nasa.gov/image/PIA00046/PIA00046~small.jpg",
price_per_night: 15)
neptune.save
