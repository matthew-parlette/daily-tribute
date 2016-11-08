namespace :user do
  desc 'Create an admin user'
  task create_admin: :environment do
    @fields = get_user_fields
    @fields[:role] = 1
    create_user
  end

  desc 'Create a target user'
  task create_target: :environment do
    @fields = get_user_fields
    @fields[:role] = 2
    create_user
  end

  desc 'Create a contributor'
  task create_contributor: :environment do
    @fields = get_user_fields
    @fields[:role] = 3
    create_user
  end

  private
  def get_user_fields
    fields = {}
    puts 'Name:'
    fields[:name] = STDIN.gets
    puts 'Email address:'
    fields[:email] = STDIN.gets
    puts 'Password:'
    fields[:password] = STDIN.gets
    return fields
  end

  def create_user
    if User.create(@fields)
      puts "Created user #{@fields[:name]}"
    else
      puts "Error adding user #{@fields[:name]}"
    end
  end

end