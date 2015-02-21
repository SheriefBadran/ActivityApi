class Category < ActiveRecord::Base
  has_many :activitycategories
  has_many :activities, through: :activitycategories

  validates :category, uniqueness: true

  def serializable_hash (options={})
    options = {
        only: [:category]
    }.update(options)
    super(options)
  end

  def to_param
    category
  end
end
