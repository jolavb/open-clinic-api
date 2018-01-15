class ResponsiblePartySerializer < ActiveModel::Serializer
  attributes :id, :study, :responsible_party_type, :name, :title, :organization,
  :affiliation

  def study
    object.study.id
  end

end
