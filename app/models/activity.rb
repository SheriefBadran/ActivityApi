class Activity < ActiveRecord::Base
  belongs_to :position
  has_many :activitycategories
  has_many :categories, through: :activitycategories

  def serializable_hash (options={})
    options = {
        only: [:id, :name]
    }.update(options)
    super(options)
  end

end
