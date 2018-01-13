class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :study, :user
  # has_one :study
  def study
    object.study.id
  end

  def user
    object.user.id
  end

end
