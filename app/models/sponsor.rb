class Sponsor < ApplicationRecord
  self.primary_key = 'id'
  belongs_to :study, foreign_key: 'nct_id'
  belongs_to :u_sponsor
end
