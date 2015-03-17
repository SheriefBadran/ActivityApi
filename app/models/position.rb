class Position < ActiveRecord::Base
  has_many :activities
  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      obj.city = geo.city
      obj.zipcode = geo.postal_code
      obj.country = geo.country_code
    end
  end
  geocoded_by :address

  after_validation :geocode, :reverse_geocode

  def serializable_hash (options={})
    options = {
        only: [:address, :latitude, :longitude, :city, :zipcode, :country]
    }.update(options)
    super(options)
  end
end
