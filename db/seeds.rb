roles = %w[admin moderator user]
roles.each do |role|
  Role.create!(name: role)
end

admin = User.new(name: 'Roman', email: 'admin@gmail.com', password: '123456')
admin.add_role roles[0]
admin.save

moderator = User.new(name: 'Ivan', email: 'moderator@gmail.com', password: '123456')
moderator.add_role roles[1]
moderator.save

User.create!(name: 'Andriy', email: 'user@gmail.com', password: '123456') # role 'user' by default