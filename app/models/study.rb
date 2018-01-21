class Study < ApplicationRecord
  scope :phase, ->(phase) { where phase: phase}
  # scope :title , ->(officialTitle) { where("officialTitle LIKE ?", "%#{officialTitle}%")}

  self.primary_key = 'nct_id'
  has_many :comments, foreign_key: 'nct_id'
  has_many :sponsors, foreign_key: 'nct_id'
  has_many :responsible_parties, foreign_key: 'nct_id'

  # belongs_to :link, foreign_key: 'nct_id'
end
