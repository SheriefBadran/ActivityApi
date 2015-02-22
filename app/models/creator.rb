class Creator < ActiveRecord::Base
  has_many :activities

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def serializable_hash (options={})
    options = {
        only: [:id, :email]
    }.update(options)
    super(options)
  end
end
