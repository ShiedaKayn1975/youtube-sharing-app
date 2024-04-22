# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user1 = User.find_or_create_by(email: 'admin@gmail.com', name: 'user1')
user1.update(password: '123456')

user2 = User.find_or_create_by(email: 'admin2@gmail.com', name: 'user2')
user2.update(password: '123456')

# Create subscription notification
sub1 = Subscription.find_or_create_by(user_id: user1.id, active: true, subscriber_id: user2.id)
sub2 = Subscription.find_or_create_by(user_id: user2.id, active: true, subscriber_id: user1.id)