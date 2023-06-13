# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'date'

puts "Seeding Database!"
puts "Cleaning Database!"
User.destroy_all
Company.destroy_all
Client.destroy_all
Move.destroy_all
Review.destroy_all
Client.destroy_all
Bid.destroy_all
Chatroom.destroy_all
Message.destroy_all

expiration_date = Time.now + (10 * 60 * 60)

puts "Creating Users"
User.create(email: 'esti@example.com', password: "123456", profile_pic: "/app/assets/images/esti.jpeg", first_name: "Esti", last_name: "Lorenzo")
User.create(email: 'ahmed@example.com', password: "123456", profile_pic: "/app/assets/images/ahmed.png", first_name: "Ahmed", last_name: "Fayed")
User.create(email: 'madhava@example.com', password: "123456", profile_pic: "/app/assets/images/madhava.png", first_name: "Madhava", last_name: "Franchin")
User.create(email: 'william@example.com', password: "123456", profile_pic: "/app/assets/images/william.png", first_name: "William", last_name: "Dela Rosa")
User.create(email: 'adam@example.com', password: "123456", profile_pic: "/app/assets/images/Adam.jpg", first_name: "Adam", last_name: "White")
User.create(email: 'lisa@example.com', password: "123456", profile_pic: "/app/assets/images/Lisa.jpg", first_name: "Lisa", last_name: "Black")

puts "Creating Company"
Company.create(name: "Realiable Move", user_id: User.find_by(first_name: "Adam").id, address: "Leipziger Str. 32, Berlin")
Company.create(name: "Umzug", user_id: User.find_by(first_name: "Lisa").id, address: "Unter den Linden 2, Berlin")

puts "Creating Client"
Client.create(user_id: User.find_by(first_name: "Esti").id)
Client.create(user_id: User.find_by(first_name: "Ahmed").id)
Client.create(user_id: User.find_by(first_name: "Madhava").id)
Client.create(user_id: User.find_by(first_name: "William").id)

puts "Creating Move"
Move.create(client_id: User.find_by(first_name: "Esti").id, date: DateTime.new(2023, 7, 24, 11, 0, 0), start_point: "Oranienstr. 110, Berlin", end_point: "Sonnenallee 213, Berlin", shipment_info: "I need a lift", status:"open", expiration: expiration_date)
Move.create(client_id: User.find_by(first_name: "Esti").id, date: DateTime.new(2023, 6, 20, 11, 0, 0), start_point: "Bernauerstr. 130, Berlin", end_point: "Leipzigerstr 13, Berlin", shipment_info: "I need a box", status:"pending", expiration: expiration_date)
Move.create(client_id: User.find_by(first_name: "Esti").id, date: DateTime.new(2023, 7, 29, 11, 0, 0), start_point: "Rosenthalerstr. 120, Berlin", end_point: "Alexanderplatz 3, Berlin", shipment_info: "I need someone to carry my stuff", status:"open", expiration: expiration_date)
Move.create(client_id: User.find_by(first_name: "Esti").id, date: DateTime.new(2023, 6, 30, 11, 0, 0), start_point: "Charlottenstr. 150, Berlin", end_point: "Lindenstr. 1, Berlin", shipment_info: "My biggest item is a piano", status:"confirmed", expiration: expiration_date)

Move.create(client_id: User.find_by(first_name: "Ahmed").id, date: DateTime.new(2023, 6, 10, 12, 0, 0), start_point: "Oranienstr. 14, Berlin", end_point: "Frankfurter Tor 232, Berlin", shipment_info: "My biggest item is a sofa", status:"open", expiration: expiration_date)
Move.create(client_id: User.find_by(first_name: "Ahmed").id, date: DateTime.new(2023, 6, 24, 12, 0, 0), start_point: "Bernauerstr. 14, Berlin", end_point: "Leipzigerstr 232, Berlin", shipment_info: "My biggest item is a fridge", status:"pending", expiration: expiration_date)
Move.create(client_id: User.find_by(first_name: "Ahmed").id, date: DateTime.new(2023, 6, 10, 12, 0, 0), start_point: "Rosenthalerstr. 14, Berlin", end_point: "Lindenstr. 232, Berlin", shipment_info: "My biggest item is a piano", status:"open", expiration: expiration_date)
Move.create(client_id: User.find_by(first_name: "Ahmed").id, date: DateTime.new(2023, 6, 10, 12, 0, 0), start_point: "Charlottenstr. 14, Berlin", end_point: "Alexanderplatz 232, Berlin", shipment_info: "My biggest item is a piano", status:"confirmed", expiration: expiration_date)

Move.create(client_id: User.find_by(first_name: "William").id, date: DateTime.new(2023, 7, 2, 13, 0, 0), start_point: "Oranienstr. 3, Berlin", end_point: "Sonnenallee 23, Berlin", shipment_info: "I need to transport my kitchen", status:"open", expiration: expiration_date)
Move.create(client_id: User.find_by(first_name: "William").id, date: DateTime.new(2023, 7, 24, 13, 0, 0), start_point: "Bernauerstr. 3, Berlin", end_point: "Leipzigerstr 23, Berlin", shipment_info: "No elevator", status:"pending", expiration: expiration_date)
Move.create(client_id: User.find_by(first_name: "William").id, date: DateTime.new(2023, 7, 2, 13, 0, 0), start_point: "Rosenthalerstr. 13, Berlin", end_point: "Lindenstr. 23, Berlin", shipment_info: "I need to transport my kitchen", status:"open", expiration: expiration_date)
Move.create(client_id: User.find_by(first_name: "William").id, date: DateTime.new(2023, 7, 2, 13, 0, 0), start_point: "Charlottenstr. 13, Berlin", end_point: "Alexanderplatz 23, Berlin", shipment_info: "I need to transport my kitchen", status:"confirmed", expiration: expiration_date)

Move.create(client_id: User.find_by(first_name: "Madhava").id, date: DateTime.new(2023, 7, 23, 15, 0, 0), start_point: "Oranienstr. 12, Berlin", end_point: "Sonnenallee 203, Berlin", shipment_info: "I don't have a lift", status:"open", expiration: expiration_date)
Move.create(client_id: User.find_by(first_name: "Madhava").id, date: DateTime.new(2023, 6, 24, 14, 0, 0), start_point: "Bernauerstr. 12, Berlin", end_point: "Leipzigerstr 203, Berlin", shipment_info: "I need to transport my kitchen", status:"open", expiration: expiration_date)
Move.create(client_id: User.find_by(first_name: "Madhava").id, date: DateTime.new(2023, 6, 23, 11, 0, 0), start_point: "Rosenthalerstr. 12, Berlin", end_point: "Lindenstr. 203, Berlin", shipment_info: "I need a box", status:"pending", expiration: expiration_date)
Move.create(client_id: User.find_by(first_name: "Madhava").id, date: DateTime.new(2023, 7, 23, 10, 0, 0), start_point: "Charlottenstr. 12, Berlin", end_point: "Alexanderplatz 203, Berlin", shipment_info: "My biggest item is a piano", status:"confirmed", expiration: expiration_date)


puts "Creating Review"
Review.new(company_id: Company.find_by(name: "Umzug").id, client_id: User.find_by(first_name: "Esti").id,efficiency_rating: 2, punctuality_rating: 4, politeness_rating: 3, content: "Good company but not too careful with the boxes", image: "/app/assets/images/broken_box.png" )
Review.new(company_id: Company.find_by(name: "Umzug").id, client_id: User.find_by(first_name: "Madhava").id,efficiency_rating: 5, punctuality_rating: 2, politeness_rating: 5, content: "They were very polite but one hour late!",image: "/app/assets/images/broken_box.png"  )
Review.new(company_id: Company.find_by(name: "Realiable Move").id, client_id: User.find_by(first_name: "Madhava").id, average_rating: 5,efficiency_rating: 5, punctuality_rating: 5, politeness_rating: 5, content: "Very good company, would recommend it to anyone", image: "/app/assets/images/perfect_service.png" )

puts "Seeded successfully"

# puts "Creating Bids"
# Message.new(content:"Hey were are you? I am downstairs but cannot see you")
# Message.new(content:"Sorry. Stuck in a traffic jam. Will be 40 minutes late")
# Message.new(content:"40 minutes have passed but still cannot see you. Are you coming?")
# Message.new(content:"Yes! Still stuck in the traffic jam. Will be another 20 minutes late. Sorry for the inconveniences.")

# Chatroom.new(company_id: Company.find_by(name: "Umzug"), client_id:User.find_by(first_name: "Madhava"), content: Message.find_by(content:"Hey were are you? I am downstairs but cannot see you", status: "read"))
# Chatroom.new(company_id: Company.find_by(name: "Umzug"), client_id:User.find_by(first_name: "Madhava"), content: Message.find_by(content:"Sorry. Stuck in a traffic jam. Will be 40 minutes late", status: "read"))
# Chatroom.new(company_id: Company.find_by(name: "Umzug"), client_id:User.find_by(first_name: "Madhava"), content: Message.find_by(content:"40 minutes have passed but still cannot see you. Are you coming?", status: "read"))
# Chatroom.new(company_id: Company.find_by(name: "Umzug"), client_id:User.find_by(first_name: "Madhava"), content: Message.find_by(content:"Yes! Still stuck in the traffic jam. Will be another 20 minutes late. Sorry for the inconveniences.", status: "read"))
