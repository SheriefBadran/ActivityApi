class Activity < ActiveRecord::Base
  belongs_to :position
  has_many :activitycategories
  has_many :categories, through: :activitycategories
end
