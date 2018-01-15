class Study < ApplicationRecord
  self.primary_key = 'nct_id'
  has_many :comments, foreign_key: 'nct_id'
  has_many :sponsors, foreign_key: 'nct_id'
  has_many :responsible_parties, foreign_key: 'nct_id'
  belongs_to :link, foreign_key: 'nct_id'
  # belongs_to :study, foreign_key: 'nct_id'
end
