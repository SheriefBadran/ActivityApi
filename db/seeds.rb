# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# test@test.se: testpassword
# admin@test.se: adminpassword

user = User.create!({
  id: 1, email: 'test@test.se',
  password: 'testpassword',
  api_key: 'da3bebae-b6a1-4333-9835-b4d94387b1b1',
  admin: 'false'
})

admin = User.create!({
  id: 2, email: 'admin@test.se',
  password: 'adminpassword',
  api_key: '9864e2f2-212c-4984-8580-fdd6f6a00b95',
  admin: 'true'
})
user.save
admin.save

# Create Positions
pos1 = Position.create(
   latitude:56.6810744,
   longitude: 16.3582432,
   city: 'Kalmar',
   zipcode: '39236',
   country: 'SE',
   address: 'Kalmar Tennisklubb 392 36 Kalmar'
)
pos2 = Position.create(
    latitude:56.676153,
    longitude: 16.36335,
    city: 'Kalmar',
    zipcode: '39236',
    country: 'SE',
    address: 'Ängöleden 10'
)
pos3 = Position.create(
    latitude:56.800608,
    longitude: 16.588675,
    city: 'Borgholm C',
    zipcode: '38792',
    country: 'SE',
    address: 'Landsvägen Halltorp 105, Borgholm'
)
pos4 = Position.create(
    latitude:56.6799126,
    longitude: 16.4590378,
    city: 'Kalmar',
    zipcode: '39120',
    country: 'SE',
    address: 'Box 54'
)

# Create Categories
cat1 = Category.create(category: "idrott")
cat2 = Category.create(category: "hälsa")

# Create Creators
cr1 = Creator.create(
    email: "test@test.com",
    password: "lotsofsecrets",
    password_confirmation: "lotsofsecrets"
)

cr2 = Creator.create(
    email: "test2@test.com",
    password: "supersecret",
    password_confirmation: "supersecret"
)

# Create Activities
act1 = Activity.create(
    name: "Kalmar Tennisklubb",
    description: "Kalmar tennisklubb har en inomhushall med hardcourt banor. Det finns ävent ett gym och café.",
    indoors: true,
    position_id: 1,
    creator_id: 1
)

act2 = Activity.create(
    name: "Kalmar Kanotklubb",
    description: "Kalmar kanotklubb delar vi intresset av att paddla över olika kajaktyper och ambitionsnivåer. Oavsett om Du är helt ny eller erfaren paddlare så finns här en möjlighet att träffa fler likasinnade. Varje tisdagkväll mellan maj och september så tar våra erfarna ledare emot nya paddlare i något vi kallar för prova-på. En liten tur i Kalmars vatten för de som ännu inte är medlemmar, men som vill testa upplevelsen av att färdas i en smidig farkost på vattnet. Som ny medlem erbjuds man en grundkurs i kajakpaddling, för att lära känna kajaken och vattnet på ett bra sätt.",
    indoors: false,
    position_id: 2,
    creator_id: 1
)

act3 = Activity.create(
    name: "Halltorps Gästgiveri",
    description: " Välkommen till Halltorps Gästgiveri, vackert beläget på landborgen mitt på Ölands västra kust. Hela den vackra ön inom bekväm räckvidd och på gästgiveriet erbjuds charmiga hotellrum, välsmakande middagar, personlig service och möjlighet till sköna spabehandlingar.",
    indoors: true,
    position_id: 3
)

act4 = Activity.create(
    name: "Kalmar-mgk-bangolf",
    description: "Vår anläggning ligger i det mycket natursköna området Ekudden. Vi erbjuder förutom två mycket fina 18-håls minigolfbanor, försäljning av kaffe/te, kakor, glass, godis och läsk. Hela anläggningen drivs ideellt och alla inkomster tillfaller Kalmar Minigolfklubb.",
    indoors: false,
    position_id: 4,
    creator_id: 1
)

# Create Activitycategories
actcat1 = Activitycategory.create(activity_id: 1, category_id: 1)
actcat2 = Activitycategory.create(activity_id: 2, category_id: 1)
actcat2 = Activitycategory.create(activity_id: 3, category_id: 2)
actcat2 = Activitycategory.create(activity_id: 4, category_id: 1)