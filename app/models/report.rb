class Report < ActiveRecord::Base
    validates :description, presence: true, length: { minimum: 10 }
    belongs_to :user
    belongs_to :game
    belongs_to :ad
    belongs_to :target_user
    belongs_to :review
end
