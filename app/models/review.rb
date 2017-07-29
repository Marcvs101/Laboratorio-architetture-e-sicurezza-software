class Review < ActiveRecord::Base
    belongs_to :user
    belongs_to :game
    has_many :reports, :dependent => :destroy
end
