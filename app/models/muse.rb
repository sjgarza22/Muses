class Muse < ActiveRecord::Base
    belongs_to :user
    has_many :posts, through: :museposts
end