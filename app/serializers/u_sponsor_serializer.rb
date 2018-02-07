class USponsorSerializer < ActiveModel::Serializer
  attributes :id, :name, :studies, :studycount, :phases


  def studies
    object.studies.pluck(:nct_id)
  end

  def studycount
    object.studies.count
  end

  def phases
    group = object.studies.group(:phase, :overall_status).count
    phases = []
      group.each_with_index{|(key, value), index|
        phases << { barLabel: key[0], sliceLabel: key[1], value: value, index: index }
      }
    phases
  end

end
