module RelationshipsHelper

  #相手から許可をもらっていたらtrueを返す．
  def access?(user)
    user.following.include?(current_user)
  end
end
