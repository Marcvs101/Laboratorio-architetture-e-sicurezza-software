class Game < Reportable
    attr_accessor :name, :description, :genre, :year, :maker, :pegi
    belongs_to :user
    has_many :reviews
    has_many :ads
end
