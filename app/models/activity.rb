class Activity < ActiveRecord::Base
  belongs_to :creator
  belongs_to :position, :dependent => :destroy
  has_many :activitycategories
  has_many :categories, through: :activitycategories

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  scope :order_by_created_desc, -> { order('created_at DESC') }

  def serializable_hash (options={})
    options = {
        only: [:id, :name, :indoors, :description],
        include: [:position, :creator]
    }.update(options)
    json = super(options)
    # HATEOAS - set path in json object sent to client.
    json['url'] = Rails.application.routes.url_helpers.api_activity_path(self)
    puts self.categories.inspect
    json['categories'] = self.categories.as_json {}

    return json
  end

end
