class User
  attr_reader :first_name, :last_name, :username, :avatar

  def initialize(opts)
    @first_name = opts[:first_name]
    @last_name = opts[:last_name]
    @username = opts[:username]
    @avatar = opts[:avatar]
  end

  def full_name
    [first_name, last_name].join(' ')
  end
end
