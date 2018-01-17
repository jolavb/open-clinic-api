class ResponsibleParty < ApplicationRecord
  self.primary_key = 'id'
  # belongs_to :study, foreign_key: 'nct_id'
end
