class ResponsibleParty < ApplicationRecord
  self.primary_key = 'id'
  # I believe this is actually a has_many
  belongs_to :study, foreign_key: 'nct_id'
end
