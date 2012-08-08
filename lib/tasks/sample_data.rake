namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Big Sean",
				 title: "Big Sean's Big Beats",
				 nickname: "#swag",
				 description: "Big Sean is our resident celebrity here at EduTainment. Can you guess why? (Hint: Math, math, math, math...)",
				 email: "bigsean@math.com",
				 password: "defjam2012",
				 password_confirmation: "defjam2012")	
	admin.toggle!(:admin)
	
	standards = User.create!(name: "Rockin' the Standards",
				 title: "Rocking and Rolling with the Standards",
				 nickname: "",
				 title: "Rock and Roll with some very cool dudes.",
				 email: "rts@defjam.com",
				 password: "defjam2012",
				 password_confirmation: "defjam2012")
	standards.videos.create!(title: "4th Grader Raps about Place Value",
							 vid_url: "http://www.youtube.com/embed/bWgZsJmATsI",
							 description: "Join the thousands of parents, teachers, and kids who are Rockin the Standards across the nation!")
							 
	standards.videos.create!(title: "The Perimeter-Area Song",
							 vid_url: "http://www.youtube.com/embed/iaU1eX_DPkY",
							 description: "Daaaamn these kids are into this song!")
							 
	98.times do |n|
	  name = Faker::Name.name
	  titl = "The Algebraic Adventures of an Ordinary Guy or Gal"
	  nick = "Dr. Boss"
	  email = "example-#{n+1}@example.com"
	  password = "password"
	  User.create!(name: name,
				   title: title,
				   nickname: nick,
				   email: email,
				   password: password,
				   password_confirmation: password)
	end
	users = User.all(limit: 6)
	3.times do
	  v_url = "http://www.youtube.com/embed/hX1YVzdnpEc"
	  users.each { |user| user.videos.create!(title: "Sample Barack Video",
											  vid_url: v_url,
											  description: "Can't get enough of this one. Obama2012!") 
		}
	end
	admin.videos.create!(title: "Math, Math, Math...",
					 vid_url: "http://www.youtube.com/embed/pn1VGytzXus",
					 description: "The #1 Hit from Big Sean")

  end
end