class User < ActiveRecord::Base
  has_many :books
  has_many :genres, :through => :books
   validates :name, presence: true

   #add email presence
   #add validation for email uniqueness
   #add has_secure_password
end
