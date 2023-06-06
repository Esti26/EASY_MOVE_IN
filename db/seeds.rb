# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Seeding Database!"
puts "Cleaning Database!"
Move.delete_all
User.delete_all
Review.delete_all
Offer.delete_all
Company.delete_all
Client.delete_all
Bid.delete_all
Chat.delete_all
Offer.delete_all

t = Time.now
expiration_date = t*10*60*60;

User.create(email: 'esti@example.com', password: "123456", profile_pic: "/app/assets/images/esti.jpeg", first_name: "Esti", last_name: "Lorenzo")
User.create(email: 'ahmed@example.com', password: "123456", profile_pic: "/app/assets/images/ahmed.png", first_name: "Ahmed", last_name: "Fayed")
User.create(email: 'madhava@example.com', password: "123456", profile_pic: "/app/assets/images/madhava.png", first_name: "Madhava", last_name: "Franchin")
User.create(email: 'william@example.com', password: "123456", profile_pic: "/app/assets/images/william.png", first_name: "William", last_name: "Dela Rosa")
User.create(email: 'adam@example.com', password: "123456", profile_pic: "/app/assets/images/Adam.jpg", first_name: "Adam", last_name: "White")
User.create(email: 'lisa@example.com', password: "123456", profile_pic: "/app/assets/images/Lisa.jpg", first_name: "Lisa", last_name: "Black")

Company.create(name: "Realiable Move", user_id: User.find_by(first_name: "Adam"), hq_location: "Leipziger Str. 32, Berlin")
Company.create(name: "Umzug", user_id: User.find_by(first_name: "Lisa"), hq_location: "Unter den Linden 2, Berlin")

Client.create(user_id: User.find_by(first_name: "Esti"))
Client.create(user_id: User.find_by(first_name: "Ahmed"))
Client.create(user_id: User.find_by(first_name: "Madhava"))
Client.create(user_id: User.find_by(first_name: "William"))

Move.create(client_id: User.find_by(first_name: "Esti"), date: Datetime.new(2023, 6, 20, 11, 0, 0), start_point: "Oranienstr. 10, Berlin", end_point: "Sonnenallee 213, Berlin", shipment_info: "I need a lift", status:"pending", expiration: expiration_date)
Move.create(client_id: User.find_by(first_name: "Ahmed"), date: Datetime.new(2023, 6, 20, 11, 0, 0), start_point: "Oranienstr. 14, Berlin", end_point: "Sonnenallee 232, Berlin", shipment_info: "My biggest item is a piano", status:"pending", expiration: expiration_date)
Move.create(client_id: User.find_by(first_name: "William"), date: Datetime.new(2023, 6, 20, 11, 0, 0), start_point: "Oranienstr. 13, Berlin", end_point: "Sonnenallee 23, Berlin", shipment_info: "I need to transport my kitchen", status:"pending", expiration: expiration_date)
Move.create(client_id: User.find_by(first_name: "Madhava"), date: Datetime.new(2023, 6, 20, 11, 0, 0), start_point: "Oranienstr. 12, Berlin", end_point: "Sonnenallee 203, Berlin", shipment_info: "I don't have a lift", status:"pending", expiration: expiration_date)

Review.new(company_id: Company.find_by(name: "Umzug"), client_id: Client.find_by(user_id: User.find_by(name:"Esti")), efficiency_rating: 2, punctuality_rating: 4, politeness_rating: 3, average_rating: 3, content: "Good service but they are not too careful with the boxes", image: "/app/assets/images/broken_box.png")
Review.new(company_id: Company.find_by(name: "Umzug"), client_id: Client.find_by(user_id: User.find_by(name:"Madhava")), efficiency_rating: 4, punctuality_rating: 1, politeness_rating: 4, average_rating: 3, content: "The price is good but they arrived 1 hour late!")
Review.new(company_id: Company.find_by(name: "Realiable Move"), client_id: Client.find_by(user_id: User.find_by(name:"William")), efficiency_rating: 5, punctuality_rating: 5, politeness_rating: 5, average_rating: 5, content: "Amazing company! I would recommend it to anyone", image: "/app/assets/images/perfect_service.png")

Message.new(content: "Hello, where are you? I cannot see you")
Message.new(content: "Sorry, we are coming 40 minutes late. There is a lot of traffic")
Message.new(content: "40 Minutes have passed and still cannot see you! Are you coming?")
Message.new(content: "Yes! Still stuck in the traffic jam. We are coming in 20 minutes. Sorry! :(")

Chatroom.new(company_id: Company.find_by(name: "Umzug"), Client_id: User.find_by(name:"Madhava"), message_id: Message.find_by(content: "Hello, where are you? I cannot see you"), status: "read")
Chatroom.new(company_id: Company.find_by(name: "Umzug"), Client_id: User.find_by(name:"Madhava"), message_id: Message.find_by(content: "Sorry, we are coming 40 minutes late. There is a lot of traffic"), status: "read")
Chatroom.new(company_id: Company.find_by(name: "Umzug"), Client_id: User.find_by(name:"Madhava"), message_id: Message.find_by(content: "40 Minutes have passed and still cannot see you! Are you coming?"), status: "read")
Chatroom.new(company_id: Company.find_by(name: "Umzug"), Client_id: User.find_by(name:"Madhava"), message_id: Message.find_by(content: "Yes! Still stuck in the traffic jam. We are coming in 20 minutes. Sorry! :("), status: "read")
