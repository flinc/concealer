class User

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def relation_level_to(user)
    (user == self) ? :myself : :friends
  end

end
