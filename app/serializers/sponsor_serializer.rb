class SponsorSerializer < ActiveModel::Serializer
  attributes :id, :study, :name, :agency_class, :lead_or_collaborator
  def study
    object.study.id
  end
end
