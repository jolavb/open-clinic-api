class Study < ApplicationRecord
  # scope :title , ->(officialTitle) { where("officialTitle LIKE ?", "%#{officialTitle}%")}

  self.primary_key = 'nct_id'
  has_many :comments, foreign_key: 'nct_id'
  has_many :sponsors, foreign_key: 'nct_id'
  has_many :responsible_parties, foreign_key: 'nct_id'

  def self.phase(phase)
    where('phase = ?', phase).paginate(page: 1, per_page: 50).order('nct_id DESC')
  end

  # belongs_to :link, foreign_key: 'nct_id'
end
