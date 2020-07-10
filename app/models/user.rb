class User < ActiveRecord::Base
    has_secure_password
    has_many :posts
    has_many :muses
    validates_presence_of :username, :email, :password
end