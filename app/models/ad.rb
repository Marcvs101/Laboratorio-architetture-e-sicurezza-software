class Ad < Reportable
    attr_accessor :description, :type, :location, :delivery
    belongs_to :user
    belongs_to :game
end
