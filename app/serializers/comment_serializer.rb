class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :study
  # has_one :user
  # has_one :study
  def study
    object.study.id
  end

end
