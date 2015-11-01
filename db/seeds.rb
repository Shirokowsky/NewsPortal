users = User.create([
  { nickname: 'Admin',
    email: 'admin@example.com',
    password: '123',
    password_confirmation: '123',
    admin: true
  },
  { nickname: 'User',
    email: 'user@example.com',
    password: '123',
    password_confirmation: '123',
  }
])

categories = Category.create([
  { title:'sport' },
  { title:'science' },
  { title:'space' }
])