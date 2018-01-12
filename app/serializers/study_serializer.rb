class StudySerializer < ActiveModel::Serializer
  attributes :id, :official_title, :brief_title, :comments

  def comments
    comment = Comment.where(:nct_id => object.id)
    return comment
  end
end
