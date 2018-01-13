class StudySerializer < ActiveModel::Serializer
  attributes :id, :official_title, :brief_title, :comments

  def comments
    object.comments.pluck(:id)
  end
end
