class StudySerializer < ActiveModel::Serializer
  attributes :id, :official_title, :brief_title, :comments, :study_type,
             :baseline_population, :overall_status, :phase, :enrollment,
             :enrollment_type, :source, :limitations_and_caveats, :is_fda_regulated_drug,
             :is_fda_regulated_device, :target_duration, :primary_completion_date, :nlm_download_date_description

  def comments
    object.comments.pluck(:id)
  end
end
