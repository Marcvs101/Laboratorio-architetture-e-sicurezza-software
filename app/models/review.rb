class Review < ActiveRecord::Base
    validates :description, presence: true
    validates :rating, presence: true
    belongs_to :user
    belongs_to :game
    has_many :reports, :dependent => :destroy
end
