class Study < ApplicationRecord
  self.primary_key = 'nct_id'
  has_many :comments, foreign_key: 'nct_id'
end
