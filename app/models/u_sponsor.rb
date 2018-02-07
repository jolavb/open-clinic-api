class USponsor < ApplicationRecord
  has_many :sponsors
  has_many :studies, through: :sponsors
end
