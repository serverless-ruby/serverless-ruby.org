class PostPolicy < DudePolicy::BasePolicy
  def able_to_update_post?(dude:)
    return true if dude == resource.user
    false
  end
end
