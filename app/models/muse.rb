class Muse < ActiveRecord::Base
    belongs_to :user
    has_many :posts
    validates_presence_of :blog_name, :name
    validates :blog_name, uniqueness: true
end