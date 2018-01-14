class Sponsor < ApplicationRecord
  self.primary_key = 'id'
  belongs_to :study, foreign_key: 'nct_id'
  # has_many :studies, foreign_key: 'nct_id'
end
