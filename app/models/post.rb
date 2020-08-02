class Post < ActiveRecord::Base
    belongs_to :user
    belongs_to :muse
    validates_presence_of :title, :content
end