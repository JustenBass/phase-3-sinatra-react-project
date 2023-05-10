puts "🌱 Seeding data..."

    movies = [
    "The Bullet Train",
    "Once Upon A Time In... Hollywood",
    "MoneyBall",
    "Fight Club",
    "Troy",
    "Interview With The Vampire",
    "Tomb Raider"
]

    brad_pitt = Actor.create(name: "Brad Pitt", golden_globe_awards: 2 )
    angelina_jolie = Actor.create(name: "Angelina Jolie", golden_globe_awards: 3)

    Movie.create(name: movies[0], actor_id: brad_pitt.id)
    Movie.create(name: movies[1], actor_id: brad_pitt.id)
    Movie.create(name: movies[2], actor_id: brad_pitt.id)
    Movie.create(name: movies[3], actor_id: brad_pitt.id)
    Movie.create(name: movies[4], actor_id: brad_pitt.id)
    Movie.create(name: movies[5], actor_id: brad_pitt.id)
    Movie.create(name: movies[6], actor_id: angelina_jolie.id)


puts "✅ Done seeding!"
