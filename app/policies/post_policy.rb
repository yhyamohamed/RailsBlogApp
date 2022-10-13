class PostPolicy
  attr_reader :cur_user, :post

  def initialize(current_user, post)
    @cur_user = current_user
    @post = post
  end

  def update?
    cur_user.id == post.user.id
  end

  def delete?
    cur_user.id == post.user.id
  end


end