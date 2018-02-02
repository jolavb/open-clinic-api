class Study < ApplicationRecord
  default_scope { Study.all }
  scope :title, ->(officialTitle) { where('official_title LIKE ?', "%#{officialTitle}%") unless officialTitle.empty?}
  scope :phase, ->(phase) { where phase: phase if phase }


  self.primary_key = 'nct_id'
  has_many :comments, foreign_key: 'nct_id'
  has_many :sponsors, foreign_key: 'nct_id'
  has_many :responsible_parties, foreign_key: 'nct_id'

  def self.search(params)
    if params[:phase].empty?
      Study.paginate(page: params[:page], per_page: 50).order('nct_id DESC')
    else
      where(phase: params[:phase]).paginate(page: params[:page], per_page: 50).order('nct_id DESC')
    end
  end

  def self.title_search(params)
    if params[:officialTitle].empty?
      Study.paginate(page: params[:page], per_page: 50).order('nct_id DESC')
    else
      where('official_title LIKE ?', "%#{params[:officialTitle]}%").paginate(page: params[:page], per_page: 50).order('nct_id DESC')
    end
  end

  def testSearch(params)

  end

  # belongs_to :link, foreign_key: 'nct_id'
end
