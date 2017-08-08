if Rails.env.development?

    # -------------------------------------------------------------------------------------------------------------------
    # Test users
    # -------------------------------------------------------------------------------------------------------------------
    def create_user(email, password)
      User.create_with(email: email, password: password).find_or_create_by(email: email)
    end

    puts 'Creating users'

    create_user('alpha@example.com', 'alphapassword')
    create_user('beta@example.com', 'betapassword')
    create_user('gamma@example.com', 'gammapassword')

    @alpha = User.where(email: 'alpha@example.com')[0].id
    @beta = User.where(email: 'beta@example.com')[0].id
    @gamma = User.where(email: 'gamma@example.com')[0].id

    # -------------------------------------------------------------------------------------------------------------------
    # Test notes
    # -------------------------------------------------------------------------------------------------------------------
    def create_note(title, content, user_id)
      Note.create(title: title, content: content, user_id: user_id)
    end

    puts 'Creating notes'

    create_note('Ruby Test', "```ruby\r\ndef hello\r\n    puts 'hello'\r\nend\r\n```", @alpha)
    create_note('Ruby Test', "```ruby\r\ndef hello\r\n    puts 'hello'\r\nend\r\n```", @beta)
    create_note('Ruby Test', "```ruby\r\ndef hello\r\n    puts 'hello'\r\nend\r\n```", @gamma)

    # -------------------------------------------------------------------------------------------------------------------
    # Test uploads
    # -------------------------------------------------------------------------------------------------------------------
    def create_upload(name, attachment, user_id)
      Upload.create(name: name, attachment: attachment, user_id: user_id)
    end

    puts 'Creating uploads'

    image = Rails.root.join("db/images/test.jpeg").open

    create_upload('Image Test', image, @alpha)
    create_upload('Image Test', image, @beta)
    create_upload('Image Test', image, @gamma)
end
