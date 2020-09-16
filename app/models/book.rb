class Book < ActiveRecord::Base
  belongs_to :user
  belongs_to :genre
   validates :title, presence: true
   validates :author, presence: true
   scope :read, ->{where(read: true)}
   scope :unread, ->{where(read: false)}
end
