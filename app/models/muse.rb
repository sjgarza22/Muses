class Muse < ActiveRecord::Base
    belongs_to :user
    has_many :posts, through :user #Check if this is correct
end