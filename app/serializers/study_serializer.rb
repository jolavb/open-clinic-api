class StudySerializer < ActiveModel::Serializer
  attributes :id, :official_title, :brief_title, :comments

  def comments
    comments = Comment.where(:nct_id => object.id)
    comments.map {|comment| comment.id}
  end
end
