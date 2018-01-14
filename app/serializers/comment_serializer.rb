class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :study, :user, :created_at
  # has_one :study
  def study
    object.study.id
  end

  def user
    object.user.id
  end

end
