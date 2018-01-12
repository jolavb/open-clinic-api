class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :study, foreign_key: 'nct_id'
end
