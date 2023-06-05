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

User.create(email: 'esti@ezmovein.com', password: "123456", profile_pic: "/app/assets/images/esti.jpeg", first_name: "Esti", last_name: "Lorenzo")
User.create(email: 'ahmed@ezmovein.com', password: "123456", profile_pic: "/app/assets/images/ahmed.png", first_name: "Ahmed", last_name: "Fayed")
User.create(email: 'madhava@ezmovein.com', password: "123456", profile_pic: "/app/assets/images/madhava.png", first_name: "Madhava", last_name: "Franchin")
User.create(email: 'william@ezmovein.com', password: "123456", profile_pic: "/app/assets/images/william.png", first_name: "William", last_name: "Dela Rosa")
User.create(email: 'adam@movecompany.com', password: "123456", profile_pic: "/app/assets/images/Adam.jpg", first_name: "Adam", last_name: "White")
User.create(email: 'lisa@movecompany.com', password: "123456", profile_pic: "/app/assets/images/Lisa.jpg", first_name: "Lisa", last_name: "Black")

Company.create(name: "Realiable_Move", user_id: User.find_by(first_name: "Adam"), hq_location: "Leipziger Str. 32, Berlin")
Company.create(name: "Umzug", user_id: User.find_by(first_name: "Lisa"), hq_location: "Unter den Linden 2, Berlin")

Move.create(client_id: User.find_by(first_name: "Esti"), date: Datetime.new(2023, 6, 20, 11, 0, 0), start_point: "Oranienstr. 10, Berlin", end_point: "Sonnenallee 213, Berlin", shipment_info: "I need a lift", status:"pending", expiration: expiration_date)
Move.create(client_id: User.find_by(first_name: "Ahmed"), date: Datetime.new(2023, 6, 20, 11, 0, 0), start_point: "Oranienstr. 14, Berlin", end_point: "Sonnenallee 232, Berlin", shipment_info: "My biggest item is a piano", status:"pending", expiration: expiration_date)
Move.create(client_id: User.find_by(first_name: "William"), date: Datetime.new(2023, 6, 20, 11, 0, 0), start_point: "Oranienstr. 13, Berlin", end_point: "Sonnenallee 23, Berlin", shipment_info: "I need to transport my kitchen", status:"pending", expiration: expiration_date)
Move.create(client_id: User.find_by(first_name: "Madhava"), date: Datetime.new(2023, 6, 20, 11, 0, 0), start_point: "Oranienstr. 12, Berlin", end_point: "Sonnenallee 203, Berlin", shipment_info: "I don't have a lift", status:"pending", expiration: expiration_date)

