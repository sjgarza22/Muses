class Muse < ActiveRecord::Base
    belongs_to :user
    has_many :museposts
    has_many :posts, through: :museposts
    validates_presence_of :name
end