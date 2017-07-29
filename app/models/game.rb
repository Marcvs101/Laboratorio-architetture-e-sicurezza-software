class Game < ActiveRecord::Base
    belongs_to :user
    has_many :reviews, :dependent => :destroy
    has_many :ads, :dependent => :destroy
    has_many :reports, :dependent => :destroy

    def self.search(target)
        where("name LIKE ?", "%#{target}%")
        where("description LIKE ?", "%#{target}%")
        where("genre LIKE ?", "%#{target}%")
        where("year LIKE ?", "%#{target}%")
        where("maker LIKE ?", "%#{target}%")
        where("pegi LIKE ?", "%#{target}%")
    end
end
