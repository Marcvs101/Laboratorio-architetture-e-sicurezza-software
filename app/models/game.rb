class Game < Reportable
    belongs_to :user
    has_many :reviews
    has_many :ads

    def self.search(target)
        where("name LIKE ?", "%#{target}%")
        where("description LIKE ?", "%#{target}%")
        where("genre LIKE ?", "%#{target}%")
        where("year LIKE ?", "%#{target}%")
        where("maker LIKE ?", "%#{target}%")
        where("pegi LIKE ?", "%#{target}%")
    end
end
