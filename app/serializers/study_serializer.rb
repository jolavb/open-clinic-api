class StudySerializer < ActiveModel::Serializer
  attributes :id, :official_title, :baseline_population, :comments, :study_type,
                          :baseline_population, :overall_status, :phase, :enrollment,
                          :enrollment_type, :source, :limitations_and_caveats, :is_fda_regulated_drug,
                          :is_fda_regulated_device, :target_duration, :primary_completion_date, :nlm_download_date_description,
                          :sponsors, :responsible_parties

  def attributes(*args)
    return super if @instance_options[:showdetails] #get all the attributes
    attributes_to_remove = [:comments, :study_type,
                            :baseline_population, :overall_status, :phase, :enrollment,
                            :enrollment_type, :source, :limitations_and_caveats, :is_fda_regulated_drug,
                            :is_fda_regulated_device, :target_duration, :primary_completion_date, :nlm_download_date_description,
                            :sponsors, :responsible_parties]
    filtered = super.except(*attributes_to_remove)
    filtered
  end

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
