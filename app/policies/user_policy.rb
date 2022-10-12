class UserPolicy
  attr_reader :cur_user, :user

  def initialize(current_user, user)
    @cur_user = current_user
    @user = user
  end

  def update?
    cur_user.id == user.id
  end

  def delete?
    cur_user.id == user.id
  end
end
