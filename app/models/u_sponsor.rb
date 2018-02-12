class USponsor < ApplicationRecord
  default_scope { USponsor.all }
  scope :sponsorname, ->(name) { where('name ILIKE ?', "%#{name}%") if name != 'All'}

  has_many :sponsors
  has_many :studies, through: :sponsors
end
