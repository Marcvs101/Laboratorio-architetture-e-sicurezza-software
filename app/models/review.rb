class Review < Reportable
    attr_accessor :description, :rating
    belongs_to :user
    belongs_to :game
end
