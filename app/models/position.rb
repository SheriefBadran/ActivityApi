class Position < ActiveRecord::Base
  has_many :activities
  reverse_geocoded_by :latitude, :longitude

  def serializable_hash (options={})
    options = {
        only: [:latitude, :longitude]
    }.update(options)
    super(options)
  end
end
