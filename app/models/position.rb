class Position < ActiveRecord::Base
  has_many :activities

  def serializable_hash (options={})
    options = {
        only: [:lat, :long]
    }.update(options)
    super(options)
  end
end
