class Creator < ActiveRecord::Base
  has_many :activities
  has_secure_password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  def serializable_hash (options={})
    options = {
        only: [:id, :email]
    }.update(options)
    super(options)
  end
end
