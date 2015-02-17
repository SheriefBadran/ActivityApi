class Category < ActiveRecord::Base
  has_many :activitycategories
  has_many :activities, through: :activitycategories

  def serializable_hash (options={})
    options = {
        only: [:category],
        include: [:activities]
    }.update(options)
    super(options)
  end

  def to_param
    category
  end
end
