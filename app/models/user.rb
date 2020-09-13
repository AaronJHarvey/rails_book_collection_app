class User < ActiveRecord::Base
  has_many :books
  has_many :genres, :through => :books
   validates :username, presence: true, uniqueness: true
   validates :password, presence: true, length: {minimum: 6}
  has_secure_password
end
