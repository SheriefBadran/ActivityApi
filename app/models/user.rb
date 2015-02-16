class User < ActiveRecord::Base

  # callback before_create to generate api_key and assign it to user-property api_key before saving user to database
  before_create :generate_uuid_api_key

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # In case we want to chang to base64 key.
  def generate_base64_api_key
    self.api_key = SecureRandom.base64(24)
  end

  # Common to user uuid for api keys.
  def generate_uuid_api_key
    self.api_key = SecureRandom.uuid
  end

  def delete_api_key
    self.api_key = nil
  end

end
