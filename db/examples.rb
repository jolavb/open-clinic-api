# frozen_string_literal: true

require 'csv'

@models = [Study, Sponsor, ResponsibleParty]
@dependents = [Sponsor, ResponsibleParty, Comment]

def export_studies(limit)
  CSV.open("db/production-examples/Study.csv", "a+") do |csv|
    Study.order("RANDOM()").limit(limit).each do |study|
      csv << study.attributes.values
      @dependents.each do |dependent|
        load_dependent(dependent, study)
      end
    end
  end
end

def load_dependent(dependent, study)
  CSV.open("db/production-examples/#{dependent}.csv", "a+") do |csv|
    dependent.where(nct_id: study[:nct_id]).each do |instance|
      csv << instance.attributes.values
    end
  end
end

def set_files
  @models.each do |model|
    CSV.open("db/production-examples/#{model}.csv", "wb") do |csv|
      csv << model.attribute_names
    end
  end
end

def test(limit)
  CSV.open("db/production-examples/Comment.csv", "wb") do |csv|
    csv << Comment.attribute_names
    Comment.order("RANDOM()").limit(limit).each do |comment|
      csv << comment.attributes.values
    end
  end
end


def export(limit)
  set_files
  export_studies(limit)
end

export(3000)
