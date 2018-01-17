class ResponsiblePartySerializer < ActiveModel::Serializer
  attributes :id, :responsible_party_type, :name, :title, :organization,
  :affiliation

  # def study
  #   object.study.id
  # end

end
