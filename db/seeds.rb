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
User.delete_all
Company.delete_all
Client.delete_all
Move.delete_all
Review.delete_all
Client.delete_all
Bid.delete_all
Chatroom.delete_all
Message.delete_all


expiration_date = Time.now + 10*60*60

User.create(email: 'esti@example.com', password: "123456", profile_pic: "/app/assets/images/esti.jpeg", first_name: "Esti", last_name: "Lorenzo")
User.create(email: 'ahmed@example.com', password: "123456", profile_pic: "/app/assets/images/ahmed.png", first_name: "Ahmed", last_name: "Fayed")
User.create(email: 'madhava@example.com', password: "123456", profile_pic: "/app/assets/images/madhava.png", first_name: "Madhava", last_name: "Franchin")
User.create(email: 'william@example.com', password: "123456", profile_pic: "/app/assets/images/william.png", first_name: "William", last_name: "Dela Rosa")
User.create(email: 'adam@example.com', password: "123456", profile_pic: "/app/assets/images/Adam.jpg", first_name: "Adam", last_name: "White")
User.create(email: 'lisa@example.com', password: "123456", profile_pic: "/app/assets/images/Lisa.jpg", first_name: "Lisa", last_name: "Black")

Company.create(name: "Realiable Move", user_id: User.find_by(first_name: "Adam"), address: "Leipziger Str. 32, Berlin")
Company.create(name: "Umzug", user_id: User.find_by(first_name: "Lisa"), address: "Unter den Linden 2, Berlin")

Client.create(user_id: User.find_by(first_name: "Esti"))
Client.create(user_id: User.find_by(first_name: "Ahmed"))
Client.create(user_id: User.find_by(first_name: "Madhava"))
Client.create(user_id: User.find_by(first_name: "William"))

Move.create(client_id: User.find_by(first_name: "Esti"), date: DateTime.new(2023, 6, 20, 11, 0, 0), start_point: "Oranienstr. 10, Berlin", end_point: "Sonnenallee 213, Berlin", shipment_info: "I need a lift", status:"pending", expiration: expiration_date)
Move.create(client_id: User.find_by(first_name: "Ahmed"), date: DateTime.new(2023, 6, 20, 11, 0, 0), start_point: "Oranienstr. 14, Berlin", end_point: "Sonnenallee 232, Berlin", shipment_info: "My biggest item is a piano", status:"pending", expiration: expiration_date)
Move.create(client_id: User.find_by(first_name: "William"), date: DateTime.new(2023, 6, 20, 11, 0, 0), start_point: "Oranienstr. 13, Berlin", end_point: "Sonnenallee 23, Berlin", shipment_info: "I need to transport my kitchen", status:"pending", expiration: expiration_date)
Move.create(client_id: User.find_by(first_name: "Madhava"), date: DateTime.new(2023, 6, 20, 11, 0, 0), start_point: "Oranienstr. 12, Berlin", end_point: "Sonnenallee 203, Berlin", shipment_info: "I don't have a lift", status:"pending", expiration: expiration_date)

Review.new(company_id: Company.find_by(name: "Umzug"), client_id:User.find_by(first_name: "Esti"), average_rating: 3,efficiency_rating: 2, punctuality_rating: 4, politeness_rating: 3, content: "Good company but not too careful with the boxes", image: "/app/assets/images/broken_box.png" )
Review.new(company_id: Company.find_by(name: "Umzug"), client_id:User.find_by(first_name: "Madhava"), average_rating: 4,efficiency_rating: 5, punctuality_rating: 2, politeness_rating: 5, content: "They were very polite but one hour late!" )
Review.new(company_id: Company.find_by(name: "Realiable Move"), client_id:User.find_by(first_name: "Madhava"), average_rating: 5,efficiency_rating: 5, punctuality_rating: 5, politeness_rating: 5, content: "Very good company, would recommend it to anyone", image: "/app/assets/images/perfect_service.png" )

# Message.new(content:"Hey were are you? I am downstairs but cannot see you")
# Message.new(content:"Sorry. Stuck in a traffic jam. Will be 40 minutes late")
# Message.new(content:"40 minutes have passed but still cannot see you. Are you coming?")
# Message.new(content:"Yes! Still stuck in the traffic jam. Will be another 20 minutes late. Sorry for the inconveniences.")

# Chatroom.new(company_id: Company.find_by(name: "Umzug"), client_id:User.find_by(first_name: "Madhava"), content: Message.find_by(content:"Hey were are you? I am downstairs but cannot see you", status: "read"))
# Chatroom.new(company_id: Company.find_by(name: "Umzug"), client_id:User.find_by(first_name: "Madhava"), content: Message.find_by(content:"Sorry. Stuck in a traffic jam. Will be 40 minutes late", status: "read"))
# Chatroom.new(company_id: Company.find_by(name: "Umzug"), client_id:User.find_by(first_name: "Madhava"), content: Message.find_by(content:"40 minutes have passed but still cannot see you. Are you coming?", status: "read"))
# Chatroom.new(company_id: Company.find_by(name: "Umzug"), client_id:User.find_by(first_name: "Madhava"), content: Message.find_by(content:"Yes! Still stuck in the traffic jam. Will be another 20 minutes late. Sorry for the inconveniences.", status: "read"))
