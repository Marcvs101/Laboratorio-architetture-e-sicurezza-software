class Ad < ActiveRecord::Base
    belongs_to :user
    belongs_to :game
    has_many :reports
end
