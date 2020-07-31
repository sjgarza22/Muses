class MusePost < ActiveRecord::Base
    belongs_to :muse
    belongs_to :post
end