roles = %w[admin moderator user]
roles.each do |role|
  Role.create!(name: role)
end

admin = User.create!(name: 'Roman', email: 'admin@gmail.com', password: '123456')
admin.add_role roles[0]

moderator = User.create!(name: 'Ivan', email: 'moderator@gmail.com', password: '123456')
moderator.add_role roles[1]

User.create!(name: 'Andriy', email: 'user@gmail.com', password: '123456') # role 'user' by default