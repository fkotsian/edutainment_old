# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create[{name: "Lybroan James", 
					 title: "For the Love of Math",
					 nickname: "The Mathman",
					 description: "Success is a function of your Order of Operations. Add good people, multiply time spent with them; divide the haters and subtract negative people. Solve for X. I love my X and you know Y :-).",
					 email: "ldj004@mail.harvard.edu",
					 password: "mathman",
					 password_confirmation: "mathman"}],
				   [{name: "Mary Jo Madda",
					 title: "Dr. MADD's Lab",
					 nickname: "Dr. MADD",
					 description: "I'm a spicy meatball with a side of pastrami. You never know what I'm going to do next - JUST LIKE IN SCIENCE! Ahahahahaha. What was that? Whatever, back to the lab!",
					 email: "mjm044@mail.harvard.edu",
					 password: "drmadd",
					 password_confirmation: "drmadd"}]
					 
Video.create(title: "The Mathman Begins",
			 url: "http://vimeo.com/59434151",
			 description: "The Mathman enters the scene, clean as can be. Check out this smooth cat as jams through the city streets, keepin' his math on his mind and his mind on his math. Solve for X.",
			 user: Users.first)
			 
Video.create(title: "Elements & Compounds",
			 url: "https://www.youtube.com/watch?feature=player_embedded&v=fiVeNI8R2e0",
			 description: "Ever wonder what science has in common with hip-hop? Thinkin', \"What WAS that?\" Ahahahahaha. Let Dr. MADD break it down for you, Science style.",
			 user: Users.at(2))
			 
Video.create(title: "Lab Safety",
			 url: "https://www.youtube.com/watch?v=qRoDR6TPBpk",
			 description: "Get Safe with Dr. MADD! Just remember - she's crazy, but not too crazy -- BECAUSE THAT WOULD BE CALLED INSANE! Ahahahahaha. What WAS that?",
			 user: users.last)
