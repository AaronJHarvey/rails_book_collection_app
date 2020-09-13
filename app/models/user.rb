class User < ActiveRecord::Base
  has_many :books
  has_many :genres, :through => :books
   validates :username, presence: true, uniqueness: true
  has_secure_password
   #add validation for email uniqueness
   #add has_secure_password
end
