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
    # Test folders
    # -------------------------------------------------------------------------------------------------------------------
    def create_folder(name, user_id)
      Folder.create(name: name, user_id: user_id)
    end

    puts 'Creating folders'

    create_folder('Folder 1', @alpha)
    create_folder('Folder 2', @beta)
    create_folder('Folder 3', @gamma)
    create_folder('Folder 4', @alpha)

    # -------------------------------------------------------------------------------------------------------------------
    # Test notes
    # -------------------------------------------------------------------------------------------------------------------
    def create_note(title, content, user_id, folder_id)
      Note.create(title: title, content: content, user_id: user_id, folder_id: folder_id)
    end

    puts 'Creating notes'

    create_note('Ruby Test', "```ruby\r\ndef hello\r\n    puts 'hello'\r\nend\r\n```", @alpha, 1)
    create_note('Ruby Test', "```ruby\r\ndef hello\r\n    puts 'hello'\r\nend\r\n```", @beta, 2)
    create_note('Ruby Test', "```ruby\r\ndef hello\r\n    puts 'hello'\r\nend\r\n```", @gamma, 3)

    # -------------------------------------------------------------------------------------------------------------------
    # Test uploads
    # -------------------------------------------------------------------------------------------------------------------
    def create_upload(name, attachment, user_id, folder_id)
      Upload.create(name: name, attachment: attachment, user_id: user_id, folder_id: folder_id)
    end

    puts 'Creating uploads'

    image = Rails.root.join("db/images/test.jpeg").open

    create_upload('Image Test', image, @alpha, 1)
    create_upload('Image Test', image, @beta, 2)
    create_upload('Image Test', image, @gamma, 3)
end
