class StudySerializer < ActiveModel::Serializer
  attributes :id, :official_title, :brief_title, :comments, :study_type,
             :baseline_population, :overall_status, :phase, :enrollment,
             :enrollment_type, :source, :limitations_and_caveats, :is_fda_regulated_drug,
             :is_fda_regulated_device, :target_duration, :primary_completion_date, :nlm_download_date_description,
             :sponsors, :responsible_parties

  def comments
    object.comments.pluck(:id)
  end

  def sponsors
    object.sponsors.pluck(:id)
  end

  def responsible_parties
    object.responsible_parties.pluck(:id)
  end
end
